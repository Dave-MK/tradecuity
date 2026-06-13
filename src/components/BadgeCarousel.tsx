'use client'
import { useState, useEffect } from 'react'
import Image from 'next/image'
import { motion, AnimatePresence } from 'framer-motion'

const INTERVAL = 3000

const LEVELS = [
  { n: 1,  name: 'The Apprentice',        glow: '#21E8F2' },
  { n: 2,  name: 'The Operator',          glow: '#21E8F2' },
  { n: 3,  name: 'The Analyst',           glow: '#1197FF' },
  { n: 4,  name: 'The Allocator',         glow: '#1197FF' },
  { n: 5,  name: 'The Tactician',         glow: '#0058E8' },
  { n: 6,  name: 'The Quant',             glow: '#0058E8' },
  { n: 7,  name: 'The Macro Trader',      glow: '#8b5cf6' },
  { n: 8,  name: 'The Volatility Trader', glow: '#a855f7' },
  { n: 9,  name: 'The Book Runner',       glow: '#f59e0b' },
  { n: 10, name: 'The General Partner',   glow: '#f59e0b' },
]

const RING_R = 128
const RING_C = Math.PI * 2 * RING_R

export function BadgeCarousel() {
  const [idx, setIdx] = useState(0)
  const [progress, setProgress] = useState(0)

  useEffect(() => {
    const start = Date.now()
    let frame: number
    const tick = () => {
      const elapsed = (Date.now() - start) % INTERVAL
      setProgress(elapsed / INTERVAL)
      frame = requestAnimationFrame(tick)
    }
    frame = requestAnimationFrame(tick)
    return () => cancelAnimationFrame(frame)
  }, [idx])

  useEffect(() => {
    const t = setInterval(() => {
      setIdx(i => (i + 1) % LEVELS.length)
    }, INTERVAL)
    return () => clearInterval(t)
  }, [])

  const level = LEVELS[idx]
  const dashOffset = RING_C * (1 - progress)

  return (
    <div className="flex flex-col items-center select-none gap-6">

      {/* Badge stage */}
      <div className="relative flex items-center justify-center" style={{ width: 300, height: 300 }}>

        {/* Ambient glow */}
        <motion.div
          key={`glow-${idx}`}
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          transition={{ duration: 0.8 }}
          className="absolute inset-0 rounded-full pointer-events-none"
          style={{
            background: `radial-gradient(circle at 50% 60%, ${level.glow}30 0%, ${level.glow}08 50%, transparent 70%)`,
          }}
        />

        {/* Progress ring (SVG) */}
        <svg
          className="absolute inset-0 pointer-events-none"
          width={300}
          height={300}
          viewBox="0 0 300 300"
          style={{ transform: 'rotate(-90deg)' }}
        >
          {/* Track */}
          <circle
            cx={150} cy={150} r={RING_R}
            fill="none"
            stroke="#081A35"
            strokeWidth={3}
          />
          {/* Animated fill */}
          <motion.circle
            cx={150} cy={150} r={RING_R}
            fill="none"
            stroke={level.glow}
            strokeWidth={3}
            strokeLinecap="round"
            strokeDasharray={RING_C}
            strokeDashoffset={dashOffset}
            style={{ filter: `drop-shadow(0 0 4px ${level.glow}90)` }}
          />
        </svg>

        {/* Badge image */}
        <AnimatePresence mode="wait">
          <motion.div
            key={idx}
            initial={{ opacity: 0, scale: 0.78 }}
            animate={{ opacity: 1, scale: 1    }}
            exit={{    opacity: 0, scale: 1.12  }}
            transition={{ duration: 0.38, ease: [0.16, 1, 0.3, 1] }}
            className="relative z-10"
          >
            <Image
              src={`/level-${level.n}.png`}
              alt={`Level ${level.n} — ${level.name}`}
              width={220}
              height={220}
              style={{ width: 220, height: 220 }}
              priority={level.n <= 3}
            />
          </motion.div>
        </AnimatePresence>
      </div>

      {/* Label */}
      <AnimatePresence mode="wait">
        <motion.div
          key={`label-${idx}`}
          initial={{ opacity: 0, y: 8 }}
          animate={{ opacity: 1, y: 0 }}
          exit={{    opacity: 0, y: -8 }}
          transition={{ duration: 0.3 }}
          className="text-center"
        >
          <p
            className="font-mono text-[11px] tracking-[0.2em] uppercase mb-1.5 font-medium"
            style={{ color: level.glow }}
          >
            Level {level.n}
          </p>
          <p className="font-display font-bold text-chalk text-lg">{level.name}</p>
        </motion.div>
      </AnimatePresence>

      {/* Dot track */}
      <div className="flex items-center gap-1.5">
        {LEVELS.map((l, i) => (
          <motion.button
            key={l.n}
            onClick={() => setIdx(i)}
            animate={{
              width: i === idx ? 22 : 6,
              backgroundColor: i === idx ? level.glow : '#162847',
            }}
            transition={{ duration: 0.25 }}
            style={{ height: 6, borderRadius: 3 }}
            aria-label={`Level ${l.n}`}
          />
        ))}
      </div>
    </div>
  )
}

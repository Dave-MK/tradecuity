'use client'
import { useEffect } from 'react'
import { motion, AnimatePresence } from 'framer-motion'

interface Props {
  show: boolean
  level: number
  onClose: () => void
}

const LEVEL_TITLES: Record<number, string> = {
  2:  'Chart Reader',
  3:  'Pattern Spotter',
  4:  'Structure Analyst',
  5:  'Risk Aware',
  6:  'Trend Follower',
  7:  'Edge Builder',
  8:  'Market Student',
  9:  'Skilled Trader',
  10: 'Trading Pro',
}

export function LevelUpModal({ show, level, onClose }: Props) {
  useEffect(() => {
    if (!show) return
    const t = setTimeout(onClose, 5000)
    return () => clearTimeout(t)
  }, [show, onClose])

  return (
    <AnimatePresence>
      {show && (
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          className="fixed inset-0 z-[100] flex items-center justify-center bg-obsidian/80 backdrop-blur-sm"
          onClick={onClose}
        >
          <motion.div
            initial={{ scale: 0.75, opacity: 0, y: 24 }}
            animate={{ scale: 1,    opacity: 1, y: 0  }}
            exit={{    scale: 0.9,  opacity: 0, y: -16 }}
            transition={{ type: 'spring', stiffness: 320, damping: 24 }}
            onClick={(e) => e.stopPropagation()}
            className="relative bg-slate border border-acuity-teal/40 rounded-2xl px-10 py-10 max-w-sm w-full mx-4 text-center"
          >
            {/* Glow ring */}
            <div className="absolute inset-0 rounded-2xl pointer-events-none"
              style={{ boxShadow: '0 0 60px rgba(20,184,166,0.15)' }} />

            {/* Level badge */}
            <motion.div
              initial={{ scale: 0 }}
              animate={{ scale: 1 }}
              transition={{ delay: 0.15, type: 'spring', stiffness: 400, damping: 20 }}
              className="w-20 h-20 rounded-full bg-acuity-teal/20 border-2 border-acuity-teal flex items-center justify-center mx-auto mb-5"
            >
              <span className="font-mono font-bold text-acuity-teal text-3xl">{level}</span>
            </motion.div>

            <motion.div
              initial={{ opacity: 0, y: 8 }}
              animate={{ opacity: 1, y: 0 }}
              transition={{ delay: 0.25 }}
            >
              <p className="text-[10px] font-display font-medium tracking-widest uppercase text-acuity-teal mb-1">
                Level up!
              </p>
              <h2 className="font-display font-bold text-chalk text-2xl mb-1">
                {LEVEL_TITLES[level] ?? `Level ${level}`}
              </h2>
              <p className="text-ghost text-sm font-body">
                You&apos;ve reached level {level}. Keep building your edge.
              </p>
            </motion.div>

            <motion.button
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              transition={{ delay: 0.4 }}
              onClick={onClose}
              className="mt-7 bg-acuity-teal text-obsidian font-display font-semibold text-sm px-6 py-2.5 rounded-lg hover:bg-acuity-teal/90 transition-colors"
            >
              Keep going →
            </motion.button>

            {/* Particles */}
            {[...Array(8)].map((_, i) => (
              <motion.div
                key={i}
                initial={{ opacity: 0, scale: 0 }}
                animate={{
                  opacity: [0, 1, 0],
                  scale:   [0, 1, 0],
                  x: Math.cos((i / 8) * Math.PI * 2) * 80,
                  y: Math.sin((i / 8) * Math.PI * 2) * 80,
                }}
                transition={{ delay: 0.1 + i * 0.04, duration: 0.8 }}
                className="absolute top-1/2 left-1/2 w-2 h-2 rounded-full bg-acuity-teal pointer-events-none"
                style={{ marginTop: -4, marginLeft: -4 }}
              />
            ))}
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  )
}

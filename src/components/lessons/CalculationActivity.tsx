'use client'
import { useState } from 'react'
import { motion, AnimatePresence } from 'framer-motion'

interface Props {
  problem: string
  correctAnswer: string
  tolerance: number
  unit: string
  hint?: string
  solutionSteps?: string[]
  onComplete: (score: number) => void
}

export function CalculationActivity({ problem, correctAnswer, tolerance, unit, hint, solutionSteps, onComplete }: Props) {
  const [input, setInput] = useState('')
  const [submitted, setSubmitted] = useState(false)
  const [isCorrect, setIsCorrect] = useState(false)
  const [showHint, setShowHint] = useState(false)

  const handleSubmit = () => {
    if (!input.trim() || submitted) return
    const userVal = parseFloat(input.replace(',', '.'))
    const targetVal = parseFloat(correctAnswer)
    const correct = !isNaN(userVal) && Math.abs(userVal - targetVal) <= tolerance
    setIsCorrect(correct)
    setSubmitted(true)
    setTimeout(() => onComplete(correct ? 100 : 60), 600)
  }

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter') handleSubmit()
  }

  return (
    <div className="flex flex-col gap-5 p-5 sm:p-7 max-w-2xl mx-auto w-full">
      <div className="bg-steel/20 rounded-xl p-5 border border-steel">
        <p className="text-[10px] font-display font-medium tracking-widest text-ghost uppercase mb-3">Problem</p>
        <p className="font-body text-chalk text-sm leading-relaxed">{problem}</p>
      </div>

      {hint && !submitted && (
        <div>
          <button
            onClick={() => setShowHint(v => !v)}
            className="text-[11px] font-display font-medium tracking-wide text-ghost hover:text-acuity-blue transition-colors uppercase flex items-center gap-1.5"
          >
            <span>{showHint ? '▼' : '▶'}</span>
            {showHint ? 'Hide hint' : 'Show hint'}
          </button>
          <AnimatePresence>
            {showHint && (
              <motion.p
                initial={{ opacity: 0, height: 0 }}
                animate={{ opacity: 1, height: 'auto' }}
                exit={{ opacity: 0, height: 0 }}
                className="mt-2 text-ghost text-[13px] font-body leading-relaxed bg-steel/20 rounded-lg px-4 py-3 border border-steel/60 overflow-hidden"
              >
                {hint}
              </motion.p>
            )}
          </AnimatePresence>
        </div>
      )}

      <div className="flex items-center gap-2.5">
        <input
          type="text"
          inputMode="decimal"
          value={input}
          onChange={e => setInput(e.target.value)}
          onKeyDown={handleKeyDown}
          disabled={submitted}
          placeholder="Your answer"
          className="flex-1 bg-slate border border-steel rounded-lg px-3 py-2.5 text-chalk font-mono text-sm focus:outline-none focus:border-acuity-blue transition-colors disabled:opacity-50"
          autoFocus
        />
        {unit && <span className="text-ghost text-[13px] font-body whitespace-nowrap">{unit}</span>}
        {!submitted && (
          <button
            onClick={handleSubmit}
            disabled={!input.trim()}
            className="px-4 py-2.5 bg-acuity-blue text-white text-sm font-display font-medium rounded-lg hover:bg-acuity-blue/90 transition-colors disabled:opacity-40 disabled:cursor-not-allowed"
          >
            Check
          </button>
        )}
      </div>

      <AnimatePresence>
        {submitted && (
          <motion.div
            initial={{ opacity: 0, y: 6 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.25 }}
            className={`rounded-xl p-4 border ${isCorrect ? 'bg-acuity-teal/10 border-acuity-teal/25' : 'bg-bear-red/10 border-bear-red/25'}`}
          >
            <span className={`font-display font-semibold block mb-3 text-sm ${isCorrect ? 'text-acuity-teal' : 'text-bear-red'}`}>
              {isCorrect ? `✓ Correct — ${correctAnswer} ${unit}` : `✗ Answer: ${correctAnswer} ${unit}`}
            </span>
            {solutionSteps && (
              <ol className="space-y-2 text-ghost text-[12px] font-body">
                {solutionSteps.map((step, i) => (
                  <li key={i} className="flex gap-2.5">
                    <span className="font-mono text-ghost/50 flex-shrink-0 w-4">{i + 1}.</span>
                    <span className="leading-relaxed">{step}</span>
                  </li>
                ))}
              </ol>
            )}
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  )
}

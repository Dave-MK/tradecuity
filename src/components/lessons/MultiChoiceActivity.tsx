'use client'
import { useState } from 'react'
import { motion, AnimatePresence } from 'framer-motion'

interface Props {
  question: string
  options: string[]
  correctIndex: number
  explanation: string
  onComplete: (score: number) => void
}

export function MultiChoiceActivity({ question, options, correctIndex, explanation, onComplete }: Props) {
  const [selected, setSelected] = useState<number | null>(null)
  const [answered, setAnswered] = useState(false)

  const handleSelect = (i: number) => {
    if (answered) return
    setSelected(i)
    setAnswered(true)
    setTimeout(() => onComplete(i === correctIndex ? 100 : 50), 900)
  }

  const isCorrect = selected === correctIndex

  return (
    <div className="flex flex-col gap-4 p-5 sm:p-7 max-w-2xl mx-auto w-full">
      <p className="font-display font-semibold text-chalk text-sm sm:text-[15px] leading-snug">
        {question}
      </p>

      <div className="flex flex-col gap-2.5">
        {options.map((opt, i) => {
          let state: 'idle' | 'correct' | 'wrong' | 'dimmed' = 'idle'
          if (answered) {
            if (i === correctIndex) state = 'correct'
            else if (i === selected) state = 'wrong'
            else state = 'dimmed'
          }
          return (
            <button
              key={i}
              onClick={() => handleSelect(i)}
              disabled={answered}
              className={`
                w-full text-left px-4 py-3 rounded-lg border text-sm font-body transition-all duration-200
                ${state === 'idle' ? 'border-steel bg-slate text-ghost hover:border-acuity-blue/40 hover:text-chalk hover:bg-steel/40 cursor-pointer' : ''}
                ${state === 'correct' ? 'border-acuity-teal bg-acuity-teal/10 text-acuity-teal cursor-default' : ''}
                ${state === 'wrong' ? 'border-bear-red/50 bg-bear-red/10 text-bear-red cursor-default' : ''}
                ${state === 'dimmed' ? 'border-steel/40 bg-slate/40 text-ghost/40 cursor-default' : ''}
              `}
            >
              <span className="font-mono text-[10px] mr-2.5 opacity-50">{String.fromCharCode(65 + i)})</span>
              {opt}
            </button>
          )
        })}
      </div>

      <AnimatePresence>
        {answered && (
          <motion.div
            initial={{ opacity: 0, y: 6 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.25 }}
            className={`rounded-lg p-4 border text-[13px] font-body leading-relaxed ${
              isCorrect
                ? 'bg-acuity-teal/10 border-acuity-teal/25 text-ghost'
                : 'bg-bear-red/10 border-bear-red/25 text-ghost'
            }`}
          >
            <span className={`font-display font-semibold block mb-1.5 text-sm ${isCorrect ? 'text-acuity-teal' : 'text-bear-red'}`}>
              {isCorrect ? '✓ Correct' : '✗ Not quite — here\'s why:'}
            </span>
            {explanation}
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  )
}

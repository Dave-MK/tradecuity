'use client'
import { useEffect } from 'react'
import { AnimatePresence, motion } from 'framer-motion'

export interface Achievement {
  id: string
  title: string
  desc: string
  icon: string
}

interface Props {
  achievement: Achievement | null
  onClose: () => void
}

export function checkAchievements(opts: {
  score: number
  newStreak: number
  earnedXp: number
  totalXp: number
  isFirstLesson: boolean
}): Achievement | null {
  const { score, newStreak, isFirstLesson } = opts

  if (isFirstLesson) {
    return { id: 'first-lesson', title: 'First lesson done', desc: 'Your trading education starts now.', icon: '🎓' }
  }
  if (score >= 95) {
    return { id: 'perfect-score', title: 'Near perfect', desc: 'You scored 95 or above. Exceptional accuracy.', icon: '🎯' }
  }
  if (newStreak === 5) {
    return { id: 'streak-5', title: '5-day streak', desc: 'Five days straight. Consistency is edge.', icon: '🔥' }
  }
  if (newStreak === 10) {
    return { id: 'streak-10', title: '10-day streak', desc: 'Ten days. You\'re building a real habit.', icon: '⚡' }
  }
  if (newStreak === 30) {
    return { id: 'streak-30', title: '30-day streak', desc: 'A month of daily practice. Elite territory.', icon: '🏆' }
  }
  return null
}

export function AchievementToast({ achievement, onClose }: Props) {
  useEffect(() => {
    if (!achievement) return
    const t = setTimeout(onClose, 4000)
    return () => clearTimeout(t)
  }, [achievement, onClose])

  return (
    <AnimatePresence>
      {achievement && (
        <motion.div
          key={achievement.id}
          initial={{ opacity: 0, y: 48, scale: 0.95 }}
          animate={{ opacity: 1, y: 0,  scale: 1    }}
          exit={{    opacity: 0, y: 24, scale: 0.95  }}
          transition={{ type: 'spring', stiffness: 300, damping: 22 }}
          className="fixed bottom-24 lg:bottom-6 left-1/2 -translate-x-1/2 z-50 w-max max-w-[90vw]"
        >
          <div
            className="flex items-center gap-3 bg-slate border border-acuity-teal/40 rounded-xl px-4 py-3 cursor-pointer"
            onClick={onClose}
          >
            <div className="w-9 h-9 rounded-full bg-acuity-teal/20 flex items-center justify-center text-lg flex-shrink-0">
              {achievement.icon}
            </div>
            <div>
              <p className="font-display font-semibold text-chalk text-sm leading-none mb-0.5">
                {achievement.title}
              </p>
              <p className="text-ghost text-[12px] font-body">{achievement.desc}</p>
            </div>
            <div className="w-0.5 h-0.5 rounded-full bg-acuity-teal ml-1 self-start mt-1.5 flex-shrink-0" />
          </div>
        </motion.div>
      )}
    </AnimatePresence>
  )
}

import type { Config } from "tailwindcss"

const config: Config = {
  content: ['./src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        obsidian:        '#020816',
        slate:           '#061226',
        steel:           '#081A35',
        'acuity-blue':   '#1197FF',
        'acuity-teal':   '#21E8F2',
        'acuity-cyan':   '#21E8F2',
        'acuity-deep':   '#0058E8',
        'electric-blue': '#0058E8',
        'deep-blue':     '#062B78',
        chalk:           '#F7FBFF',
        ghost:           '#A9BED6',
        muted:           '#162847',
        cloud:           '#F0F4FA',
        'bear-red':      '#FF5A5A',
        amber:           '#F5A623',
      },
      fontFamily: {
        display: ['Oxanium', 'sans-serif'],
        body:    ['Inter', 'sans-serif'],
        mono:    ['JetBrains Mono', 'monospace'],
      },
    },
  },
  plugins: [],
}
export default config

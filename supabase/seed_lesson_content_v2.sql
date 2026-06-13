-- ─────────────────────────────────────────────────────────────────────────────
-- seed_lesson_content_v2.sql
-- Replaces all canvas_exercise lesson content with properly typed, topic-specific
-- activities. Run AFTER all other seed files.
-- Safe to re-run — all UPDATEs are idempotent.
-- ─────────────────────────────────────────────────────────────────────────────

-- ══════════════════════════════════════════════════════════════════════════════
-- LEVEL 1 — THE APPRENTICE
-- ══════════════════════════════════════════════════════════════════════════════

-- how-markets-work / lesson-8
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "Which market participant continuously quotes both a buy price and a sell price, profits from the bid-ask spread, and takes no directional view on where the market is heading?",
  "options": [
    "A hedge fund running a global long/short equity book",
    "A market maker or liquidity provider",
    "A retail swing trader using technical analysis",
    "A pension fund making long-term allocations to global equities"
  ],
  "correct_index": 1,
  "explanation": "Market makers provide liquidity by continuously quoting bid and ask prices. They earn the spread between what they buy and sell and hedge their inventory rather than speculating on direction. Without them, finding a counterparty for your trade would be significantly harder and more expensive. Their role is structural — they are the mechanism through which every trade you place is executed.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'how-markets-work')
  AND slug = 'lesson-8';

-- reading-price-charts / lesson-5
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "EUR/USD opens at 1.0850 and closes at 1.0920. During the session, price dips to 1.0760 and reaches 1.0935. Which statement correctly describes this candlestick?",
  "options": [
    "A bearish candle — the close at 1.0920 is near the high, signalling exhausted buyers",
    "A bullish candle — close (1.0920) is above open (1.0850). The long lower wick to 1.0760 shows sellers briefly overwhelmed buyers, but bulls recovered and closed 70 pips above the open",
    "The wick to 1.0760 confirms bears won the session despite the higher close",
    "The body spans from 1.0760 to 1.0935, covering the full high-to-low range"
  ],
  "correct_index": 1,
  "explanation": "This is a bullish candle because close (1.0920) > open (1.0850). The body always spans between open and close — the wicks extend beyond them to the session high and low. The long lower wick (1.0850 → 1.0760, a 90-pip rejection) tells a story: sellers drove price down hard intrabar, but buyers overwhelmed them and drove it all the way back to close 70 pips above the open. This is meaningful rejection of lower prices.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'reading-price-charts')
  AND slug = 'lesson-5';

-- reading-price-charts / lesson-8
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "A swing trader holds positions for 3–7 days, spends about 1 hour per day analysing markets, and targets moves of 150–400 pips on forex pairs. Which primary analysis timeframe is most appropriate for establishing directional bias and key levels?",
  "options": [
    "1-minute and 5-minute — tight entries reduce risk",
    "15-minute and 1-hour — captures intraday momentum with precision",
    "4-hour and Daily — filters intraday noise while showing the structure a multi-day trade needs",
    "Weekly and Monthly — longer timeframes mean bigger targets"
  ],
  "correct_index": 2,
  "explanation": "The 4-hour chart defines the context for a swing trade — it smooths out intraday noise while still showing enough structure for a 3–7 day position. The daily chart establishes the directional bias and the key support/resistance levels that matter at that scale. Together they create the ''swing sweet spot'': enough signal to act, enough filter to avoid false moves. The 1-minute or 5-minute charts contain too much noise for this style; the weekly is too slow to provide actionable entries.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'reading-price-charts')
  AND slug = 'lesson-8';

-- basic-price-action / lesson-4
UPDATE lessons SET content = '{
  "activity_type": "draw_trendline",
  "ticker": "EURUSD",
  "timeframe": "D1",
  "exercise_prompt": "EUR/USD Daily is in a clear uptrend. Using the trendline tool, draw an ascending trendline connecting the two most significant swing lows visible on the chart. Your line must not cut through any candle body — it must sit beneath the lows, not slice through the price action. The system scores your angle and how accurately you connect the structural swing lows.",
  "reference_line": {"x1": 0, "y1": 78, "x2": 100, "y2": 28},
  "steps": [{"id":"1","label":"Identify the swing lows","completed":false},{"id":"2","label":"Draw your ascending trendline","completed":false},{"id":"3","label":"Review score and feedback","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'basic-price-action')
  AND slug = 'lesson-4';

-- basic-price-action / lesson-7
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "GBPUSD",
  "timeframe": "D1",
  "exercise_prompt": "GBP/USD Daily is shown with no indicators. There is one price level that has been tested from above (as support) and from below (as resistance) on multiple separate occasions — a classic role-reversal level. Using the horizontal tool, draw a line at this key level. It is the single most important price zone on this chart for defining future trade entries and exits.",
  "reference_line": {"x1": 0, "y1": 45, "x2": 100, "y2": 45},
  "steps": [{"id":"1","label":"Identify the role-reversal level","completed":false},{"id":"2","label":"Draw your horizontal line","completed":false},{"id":"3","label":"Review feedback","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'basic-price-action')
  AND slug = 'lesson-7';

-- intro-to-technical-tools / lesson-4
UPDATE lessons SET content = '{
  "activity_type": "draw_trendline",
  "ticker": "GBPUSD",
  "timeframe": "D1",
  "exercise_prompt": "GBP/USD Daily shows a clear ascending trend structure. Using the trendline tool, draw an ascending trendline from the earliest visible swing low to the most recent swing low. Your line must respect all candle bodies — no body should close below it. The system will score your line based on its angle relative to the optimal reference and whether your touch points are accurate.",
  "reference_line": {"x1": 0, "y1": 80, "x2": 100, "y2": 30},
  "steps": [{"id":"1","label":"Identify swing lows","completed":false},{"id":"2","label":"Draw your trendline","completed":false},{"id":"3","label":"Review score and feedback","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'intro-to-technical-tools')
  AND slug = 'lesson-4';

-- intro-to-technical-tools / lesson-7
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "You have just opened a blank EUR/USD H4 chart. To build a clean, actionable price action setup, which combination of tools is the correct starting point?",
  "options": [
    "20 indicators: five EMAs, RSI, MACD, Stochastic, ATR, Bollinger Bands, Ichimoku, and four oscillators",
    "One ascending trendline connecting the recent swing lows, one horizontal resistance zone, one horizontal support zone",
    "Nothing — pure price action means zero tools at all times, no exceptions",
    "A 200 EMA, 50 EMA, 20 EMA, and RSI set to 14 — used together to confirm every entry independently"
  ],
  "correct_index": 1,
  "explanation": "Clean chart analysis starts with structure. A trendline defines directional bias. Support and resistance zones identify where price has reacted before and where it is likely to react again. Three elements answer the two most important questions: what direction and where? Adding more indicators creates noise, produces contradictory signals, and delays your eye from seeing what price is actually doing. The goal is clarity — fewer, higher-quality tools deliver more edge than a cluttered chart.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'intro-to-technical-tools')
  AND slug = 'lesson-7';

-- risk-fundamentals / lesson-4
UPDATE lessons SET content = '{
  "activity_type": "calculation",
  "problem": "Account: £10,000. You risk 1% per trade. You want to go long GBP/USD at 1.2500 with a stop loss at 1.2450 — exactly 50 pips below your entry. Pip value for GBP/USD = £10 per pip per standard lot (100,000 units). What is the correct lot size to risk exactly 1% of your account on this trade?",
  "correct_answer": "0.20",
  "tolerance": 0.01,
  "unit": "lots",
  "hint": "Step 1: calculate your maximum risk in pounds. Step 2: calculate how many pounds you lose per lot if stopped out. Step 3: divide max risk by risk per lot.",
  "solution_steps": [
    "Max risk = 1% × £10,000 = £100",
    "Risk per standard lot = 50 pips × £10/pip = £500 per lot",
    "Lot size = Max risk ÷ Risk per lot = £100 ÷ £500 = 0.20 lots",
    "Trading 0.20 lots means risking exactly £100 — 1% of the account — if your stop is hit."
  ],
  "steps": [{"id":"1","label":"Calculate max risk (£)","completed":false},{"id":"2","label":"Calculate risk per lot","completed":false},{"id":"3","label":"Calculate lot size","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'risk-fundamentals')
  AND slug = 'lesson-4';

-- risk-fundamentals / lesson-7
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "EURUSD",
  "timeframe": "H1",
  "exercise_prompt": "A long trade setup on EUR/USD H1 has triggered after a bullish engulfing candle at support. Your task is to define the correct stop loss placement. Using the horizontal tool, draw a line below the most recent swing low visible on the left of the chart — this is the structural level where the trade is invalidated. Your stop sits below this low, not at the entry or anywhere inside the current candle range.",
  "reference_line": {"x1": 0, "y1": 83, "x2": 100, "y2": 83},
  "steps": [{"id":"1","label":"Identify the key swing low","completed":false},{"id":"2","label":"Draw your stop loss level","completed":false},{"id":"3","label":"Review placement","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'risk-fundamentals')
  AND slug = 'lesson-7';

-- paper-trading-and-psychology / lesson-5
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "EURUSD",
  "timeframe": "H4",
  "exercise_prompt": "A potential long setup is developing on EUR/USD H4 — price has bounced from a support zone and is consolidating. Using the horizontal tool, draw your planned entry line at the price level where you would enter long (the high of the signal candle). This defines the trigger. Then draw a second horizontal line for your stop loss — below the swing low that validates this trade. Aim for at least 2R distance between entry and your mental take profit.",
  "reference_line": {"x1": 0, "y1": 52, "x2": 100, "y2": 52},
  "steps": [{"id":"1","label":"Identify the setup","completed":false},{"id":"2","label":"Draw your entry line","completed":false},{"id":"3","label":"Draw your stop loss level","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'paper-trading-and-psychology')
  AND slug = 'lesson-5';

-- paper-trading-and-psychology / lesson-8
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "You take a loss on a trade that followed your plan perfectly. Thirty minutes later another valid setup appears. Which response most reflects disciplined trading psychology?",
  "options": [
    "Enter with double the normal position size to recover the previous loss before the session ends",
    "Take the setup at normal size — a valid setup according to your rules is worth taking regardless of the previous trade outcome",
    "Skip the next 3 setups as punishment until you feel mentally ready again",
    "Widen your stop loss on the next trade to give it more room, compensating for the recent bad luck"
  ],
  "correct_index": 1,
  "explanation": "Each trade is statistically independent from the last. A valid setup according to your plan should be executed at plan-specified size regardless of prior outcomes. The trap here is treating trades as emotionally connected — doubling size to recover (revenge trading) distorts your risk model and is driven by emotion, not edge. Skipping valid setups is also wrong — you cannot cherry-pick after losses. Widening stops changes your tested system. The correct response: take the trade at normal size, executing your plan.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'paper-trading-and-psychology')
  AND slug = 'lesson-8';


-- ══════════════════════════════════════════════════════════════════════════════
-- LEVEL 2 — THE OPERATOR
-- ══════════════════════════════════════════════════════════════════════════════

-- technical-analysis-in-depth / lesson-6
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "NAS100",
  "timeframe": "H4",
  "exercise_prompt": "NAS100 H4 is shown after a significant rally. Price is now approaching a major overhead level. Using the horizontal tool, draw a line at the single most significant resistance level visible — the price zone that has produced the most clear and repeated price rejection. This is the level you would watch most closely for a potential short setup or a breakout entry.",
  "reference_line": {"x1": 0, "y1": 30, "x2": 100, "y2": 30},
  "steps": [{"id":"1","label":"Identify the dominant resistance","completed":false},{"id":"2","label":"Draw your horizontal level","completed":false},{"id":"3","label":"Review feedback","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'technical-analysis-in-depth')
  AND slug = 'lesson-6';

-- technical-analysis-in-depth / lesson-8
UPDATE lessons SET content = '{
  "activity_type": "draw_trendline",
  "ticker": "GBPUSD",
  "timeframe": "H4",
  "exercise_prompt": "GBP/USD H4 shows a descending trendline already marked on the chart (connecting lower highs). Price is now approaching a point where this trendline meets a prior support-now-resistance horizontal zone — a confluence short area. Using the trendline tool, draw your entry trigger line: a trendline from the most recent swing high down to where price is currently approaching. This defines the precise entry angle for a short trade at the confluence.",
  "reference_line": {"x1": 5, "y1": 22, "x2": 90, "y2": 42},
  "steps": [{"id":"1","label":"Identify the confluence zone","completed":false},{"id":"2","label":"Draw your entry trendline","completed":false},{"id":"3","label":"Review feedback","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'technical-analysis-in-depth')
  AND slug = 'lesson-8';

-- chart-patterns / lesson-7
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "Price rises sharply for 3 sessions, then consolidates for 6 candles forming slightly lower highs and near-flat lows in a tight downward-slanting channel. Volume drops during the consolidation. Price then breaks above the channel top on expanding volume. What pattern is this and what does it signal?",
  "options": [
    "Rising wedge — a bearish reversal. The consolidation means buyers are trapped and a sell-off is coming",
    "Bull flag — a bullish continuation. The tight pullback pauses the trend without reversing it; the breakout targets a move equal to the original pole",
    "Ascending triangle — neutral, outcome unclear until the breakout direction confirms",
    "Head and shoulders — a major top reversal. Price will decline significantly below the consolidation low"
  ],
  "correct_index": 1,
  "explanation": "A bull flag is a continuation pattern. The flagpole is the sharp initial move; the flag is the controlled consolidation with slightly declining highs and roughly flat lows. Volume contracts during the flag (healthy — no panic selling) and expands on the breakout (genuine conviction). The measured move target is the flagpole height added from the breakout point. Key distinguishing feature from a wedge: flag channels are parallel and relatively tight, whereas rising wedges converge.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'chart-patterns')
  AND slug = 'lesson-7';

-- chart-patterns / lesson-9
UPDATE lessons SET content = '{
  "activity_type": "draw_trendline",
  "ticker": "EURUSD",
  "timeframe": "D1",
  "exercise_prompt": "EUR/USD Daily shows a head and shoulders top pattern. The left shoulder, head, and right shoulder peaks are labelled on the chart. Using the trendline tool, draw the neckline — the line connecting the two troughs that form between the shoulders. This neckline is your entry trigger: a daily close below it confirms the pattern and signals the measured move short target equal to the head-to-neckline distance.",
  "reference_line": {"x1": 15, "y1": 62, "x2": 82, "y2": 58},
  "steps": [{"id":"1","label":"Locate the two troughs","completed":false},{"id":"2","label":"Draw the neckline","completed":false},{"id":"3","label":"Review accuracy","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'chart-patterns')
  AND slug = 'lesson-9';

-- candlestick-patterns / lesson-7
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "After a sustained downtrend, a candle forms at a known monthly support level with a tiny body near the TOP of the range, a lower wick that is 3× the body length, and almost no upper wick. What is this pattern and what does it signal in this context?",
  "options": [
    "Shooting star — bearish reversal. The long wick shows sellers dominating and price should continue lower",
    "Hammer — potential bullish reversal. The long lower wick shows sellers initially drove price down hard, but buyers overwhelmed them and closed near the open. At support, this is a high-probability long signal",
    "Doji — complete indecision. Wait for more confirmation before drawing any conclusion",
    "Bearish marubozu — strong confirmation of the downtrend. No wick means sellers were in full control"
  ],
  "correct_index": 1,
  "explanation": "A hammer is defined by: small body at the top of the range, lower wick at least 2× the body, minimal upper wick. It appears at the bottom of a downtrend. The wick anatomy tells a story: sellers initially drove price well below the open (the long lower wick), but buyers stepped in aggressively and drove it all the way back up to close near the open — decisively rejecting the lower prices. At a key support level, this rejection is a meaningful reversal signal. Context matters: the same candle shape at a resistance zone in an uptrend is a hanging man — a bearish signal.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'candlestick-patterns')
  AND slug = 'lesson-7';

-- candlestick-patterns / lesson-9
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "GBPUSD",
  "timeframe": "D1",
  "exercise_prompt": "Six months of GBP/USD Daily data is shown. There is one area where a hammer or bullish engulfing candle appeared directly at a key support zone, triggering a significant multi-week rally. Using the horizontal tool, draw a line at this support level — the price zone where the highest-probability bullish reversal signal appeared. Look for the lowest price cluster from which price bounced decisively.",
  "reference_line": {"x1": 0, "y1": 73, "x2": 100, "y2": 73},
  "steps": [{"id":"1","label":"Scan the full chart for reversal signals","completed":false},{"id":"2","label":"Identify the strongest at-support signal","completed":false},{"id":"3","label":"Draw the support level","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'candlestick-patterns')
  AND slug = 'lesson-9';

-- indicators-that-work / lesson-6
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "EUR/USD H4 makes a series of higher price highs over 8 weeks. The RSI (14) at those same price peaks shows declining values: first peak RSI = 71, second peak RSI = 65, third peak RSI = 58. What is happening and what does this tell you?",
  "options": [
    "RSI confirmation — the uptrend is healthy. RSI above 50 at all peaks means momentum is intact",
    "Bearish RSI divergence — price makes higher highs but RSI makes lower highs, signalling weakening momentum. Each new price high is achieved with less buying energy, warning of a potential reversal",
    "The RSI is broken and should be removed. When it contradicts price direction it generates false signals",
    "This is RSI oversold territory — values below 70 on an uptrend are bullish buy signals"
  ],
  "correct_index": 1,
  "explanation": "Bearish divergence occurs when price makes higher highs but the RSI makes lower highs. RSI measures the speed and magnitude of price moves. When RSI starts declining while price still rises, each new high is achieved with diminishing buying energy — the trend is tiring. This doesn''t guarantee an immediate reversal, but is a significant warning, especially when RSI divergence appears near the 70 overbought zone and at key resistance. It is most reliable when the divergence spans multiple swing highs over a period of weeks.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'indicators-that-work')
  AND slug = 'lesson-6';

-- indicators-that-work / lesson-9
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "EURUSD",
  "timeframe": "H4",
  "exercise_prompt": "EUR/USD H4 is shown with RSI loaded below. The RSI has reached oversold territory (below 35) and a hammer candle has formed exactly at a prior support zone. Using the horizontal tool, draw your entry line at the high of the hammer candle — this is the entry price for a long triggered by the candle close. The combination of price action at support with RSI oversold confirmation gives this setup two independent confluences.",
  "reference_line": {"x1": 0, "y1": 63, "x2": 100, "y2": 63},
  "steps": [{"id":"1","label":"Identify the hammer at support","completed":false},{"id":"2","label":"Confirm RSI is oversold","completed":false},{"id":"3","label":"Draw your entry trigger line","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'indicators-that-work')
  AND slug = 'lesson-9';

-- risk-management-framework / lesson-4
UPDATE lessons SET content = '{
  "activity_type": "calculation",
  "problem": "A strategy tracked over 20 trades produced: 12 winning trades at an average of +2.0R each, and 8 losing trades at an average of -1.0R each. Using the expectancy formula — (Win Rate × Avg Win R) minus (Loss Rate × Avg Loss R) — what is the strategy''s expectancy per trade in R?",
  "correct_answer": "0.80",
  "tolerance": 0.05,
  "unit": "R per trade",
  "hint": "Win rate = winners ÷ total trades. Loss rate = 1 minus win rate. Then multiply each rate by its respective average outcome and subtract.",
  "solution_steps": [
    "Win rate = 12 ÷ 20 = 0.60 (60%)",
    "Loss rate = 8 ÷ 20 = 0.40 (40%)",
    "Expected gain from winners = 0.60 × 2.0R = 1.20R",
    "Expected loss from losers = 0.40 × 1.0R = 0.40R",
    "Expectancy = 1.20R − 0.40R = +0.80R per trade",
    "At +0.80R expectancy: every 10 trades you expect +8R on average. This strategy has a positive edge worth trading."
  ],
  "steps": [{"id":"1","label":"Calculate win rate and loss rate","completed":false},{"id":"2","label":"Apply expectancy formula","completed":false},{"id":"3","label":"Review worked solution","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'risk-management-framework')
  AND slug = 'lesson-4';

-- risk-management-framework / lesson-8
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "You have suffered 3 consecutive losses today. Your account is down 2.8% in a single session. Your personal daily loss limit rule is 3%. What is the correct action?",
  "options": [
    "Continue trading — you are still technically within your 3% limit and there are valid setups visible on the chart",
    "Stop trading for the day — approaching your daily limit after 3 losses means your decision-making is compromised and further losses are more likely",
    "Double your position size on the next setup to recover the day''s losses before the session closes",
    "Switch to a different market or asset class where you haven''t had losses yet today"
  ],
  "correct_index": 1,
  "explanation": "A daily loss limit exists precisely for this moment. After 3 consecutive losses, the psychological pressure to recover creates measurable impairment to decision-making — you will be more likely to over-trade, widen stops, or force setups. Being 2.8% down when your limit is 3% means one more trade could breach it with no recovery possible that day. The professional response is to stop, close screens, review the trades objectively the following morning, and return with fresh capital and fresh perspective. Discipline here protects compounding.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'risk-management-framework')
  AND slug = 'lesson-8';

-- volume-analysis / lesson-6
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "EUR/USD breaks above major resistance at 1.1200 — a level that held for 3 weeks. The breakout candle closes 25 pips above the level. However, volume on that candle is 38% of the 20-day average — well below normal. What does this indicate and how should you respond?",
  "options": [
    "Confirmed breakout — price is above the level, which is all that matters for technical analysis",
    "Low-conviction breakout — below-average volume suggests limited institutional participation. Watch for a failed break and possible reversal below 1.1200 in the next 1–3 sessions",
    "Strong breakout — low volume means there are no sellers left above 1.1200, clearing the path higher",
    "Irrelevant — forex volume data is always unreliable and should not be used in analysis"
  ],
  "correct_index": 1,
  "explanation": "Valid breakouts should be accompanied by above-average volume, which represents genuine conviction and participation from larger players. A breakout on 38% of average volume means very few participants drove the move — it may be a thin, stop-hunt breakout rather than a genuine continuation. Statistically, low-volume breakouts fail significantly more often than high-volume ones. Watch for the next 1–3 candles: if price closes back below 1.1200, the breakout has failed. A retest of 1.1200 from above on rising volume would give far more confidence for an entry.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'volume-analysis')
  AND slug = 'lesson-6';


-- ══════════════════════════════════════════════════════════════════════════════
-- LEVEL 3 — THE ANALYST
-- ══════════════════════════════════════════════════════════════════════════════

-- multi-timeframe-analysis / lesson-6
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "EURUSD",
  "timeframe": "W1",
  "exercise_prompt": "EUR/USD Weekly chart is shown. There is one dominant price level that has acted as both significant support and resistance over the past 18 months — tested from above and below on multiple separate occasions. Using the horizontal tool, draw a line at this weekly HTF resistance level. This is your top-down directional anchor: all lower-timeframe analysis begins with respect to this level.",
  "reference_line": {"x1": 0, "y1": 28, "x2": 100, "y2": 28},
  "steps": [{"id":"1","label":"Study the weekly structure","completed":false},{"id":"2","label":"Draw the dominant HTF level","completed":false},{"id":"3","label":"Review feedback","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'multi-timeframe-analysis')
  AND slug = 'lesson-6';

-- multi-timeframe-analysis / lesson-8
UPDATE lessons SET content = '{
  "activity_type": "draw_trendline",
  "ticker": "GBPUSD",
  "timeframe": "D1",
  "exercise_prompt": "GBP/USD Daily has been making lower highs across 3 months, forming a clear descending structure. Using the trendline tool, draw the descending trendline connecting the two most recent significant swing highs. This is your HTF bearish bias line — you will only look for short entries on lower timeframes when price approaches this trendline from below.",
  "reference_line": {"x1": 0, "y1": 22, "x2": 100, "y2": 48},
  "steps": [{"id":"1","label":"Identify the swing highs","completed":false},{"id":"2","label":"Draw your descending trendline","completed":false},{"id":"3","label":"Review accuracy","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'multi-timeframe-analysis')
  AND slug = 'lesson-8';

-- smart-money-concepts / lesson-9
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "EURUSD",
  "timeframe": "H4",
  "exercise_prompt": "EUR/USD H4 shows a sharp impulsive bullish move that originated from a specific 1–3 candle area. This origin zone is where institutional buying entered — the order block. Using the horizontal tool, draw a line at the TOP of that origin zone (where the aggressive buying candle opened). A pullback to return to this area is your SMC long entry trigger.",
  "reference_line": {"x1": 0, "y1": 55, "x2": 100, "y2": 55},
  "steps": [{"id":"1","label":"Identify the impulse origin","completed":false},{"id":"2","label":"Draw the order block top","completed":false},{"id":"3","label":"Review placement","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'smart-money-concepts')
  AND slug = 'lesson-9';

-- smart-money-concepts / lesson-10
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "GBPUSD",
  "timeframe": "D1",
  "exercise_prompt": "GBP/USD Daily has recently broken below a significant swing low — a structural Change of Character (CHoCH) signalling bearish intent. The last bullish impulse that drove the market up originated from an order block zone now sitting above current price. Using the horizontal tool, draw a line at the BOTTOM of that origin zone — this is where you expect price to retrace to before continuing lower, and where you would look for a high-probability short entry.",
  "reference_line": {"x1": 0, "y1": 40, "x2": 100, "y2": 40},
  "steps": [{"id":"1","label":"Identify the CHoCH level","completed":false},{"id":"2","label":"Locate the origin order block","completed":false},{"id":"3","label":"Draw the order block bottom","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'smart-money-concepts')
  AND slug = 'lesson-10';

-- fibonacci-and-elliott-wave / lesson-5
UPDATE lessons SET content = '{
  "activity_type": "draw_trendline",
  "ticker": "EURUSD",
  "timeframe": "H4",
  "exercise_prompt": "EUR/USD H4 completed a strong bullish impulse and is now pulling back. The swing low (start of the move) and swing high (end of the move) are marked with labels. Using the trendline tool, draw a line from the swing low to the swing high — this anchors your Fibonacci retracement. The 0.618 level (approximately 61.8% of the move retraced) is the prime entry zone. Score is based on accuracy of your anchor points.",
  "reference_line": {"x1": 5, "y1": 80, "x2": 92, "y2": 20},
  "steps": [{"id":"1","label":"Locate the swing low anchor","completed":false},{"id":"2","label":"Draw from swing low to swing high","completed":false},{"id":"3","label":"Review 0.618 level accuracy","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'fibonacci-and-elliott-wave')
  AND slug = 'lesson-5';

-- fibonacci-and-elliott-wave / lesson-9
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "According to Elliott Wave rules, which of the following would immediately invalidate a 5-wave impulse count?",
  "options": [
    "Wave 3 is the longest of the three impulse waves (1, 3, and 5)",
    "Wave 4 retraces back into the price territory of Wave 1 (the ranges overlap)",
    "Wave 2 retraces exactly 61.8% of Wave 1 (a deep but valid pullback)",
    "Wave 5 ends at a slightly lower high than Wave 3 (a truncated fifth)"
  ],
  "correct_index": 1,
  "explanation": "The Wave 1/4 overlap rule is one of Elliott Wave''s three non-negotiable rules: Wave 4 cannot close within the price territory of Wave 1. If it does, the count is invalid. The three inviolable rules are: (1) Wave 2 cannot retrace more than 100% of Wave 1 (cannot go below Wave 1 start), (2) Wave 3 cannot be the shortest impulse wave of waves 1, 3, and 5, (3) Wave 4 cannot overlap Wave 1. Truncated fifths (option D) are allowed under specific conditions. Wave 2 retracing 61.8% (option C) is actually the most common and expected retracement level.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'fibonacci-and-elliott-wave')
  AND slug = 'lesson-9';

-- sector-correlation-analysis / lesson-6
UPDATE lessons SET content = '{
  "activity_type": "draw_trendline",
  "ticker": "EURUSD",
  "timeframe": "D1",
  "exercise_prompt": "DXY (US Dollar Index) Daily is shown — it is in a clear uptrend, making higher lows. You want to go long GBP/USD, but GBP/USD has a strong negative correlation with USD (typically -0.80 to -0.90). Using the trendline tool, draw an ascending trendline on the DXY connecting its recent swing lows. This line represents your intermarket headwind: a rising dollar directly pressures GBP/USD lower and contradicts your long idea.",
  "reference_line": {"x1": 0, "y1": 70, "x2": 100, "y2": 30},
  "steps": [{"id":"1","label":"Analyse DXY trend direction","completed":false},{"id":"2","label":"Draw the DXY ascending trendline","completed":false},{"id":"3","label":"Review headwind assessment","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'sector-correlation-analysis')
  AND slug = 'lesson-6';

-- building-your-trading-plan / lesson-5
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "EURUSD",
  "timeframe": "H4",
  "exercise_prompt": "EUR/USD H4 is approaching a key resistance zone. Your trading plan''s short setup requires: (1) price reaches the resistance zone, (2) a bearish rejection candle forms. Using the horizontal tool, draw the entry trigger line — the price level that the rejection candle must CLOSE BELOW to trigger your short entry. Position this just beneath the rejection candle''s body close, not at the resistance zone itself.",
  "reference_line": {"x1": 0, "y1": 35, "x2": 100, "y2": 35},
  "steps": [{"id":"1","label":"Identify the resistance zone","completed":false},{"id":"2","label":"Draw your entry trigger level","completed":false},{"id":"3","label":"Review placement","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'building-your-trading-plan')
  AND slug = 'lesson-5';

-- building-your-trading-plan / lesson-8
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "Your trading plan specifies: only take long trades when price is above the 200 EMA. EUR/USD is currently 35 pips below the 200 EMA. You identify what appears to be a textbook hammer candle at support with RSI at 28 (oversold). What should you do?",
  "options": [
    "Take the long trade — the setup quality is exceptional and clearly overrides the 200 EMA filter",
    "Pass on the trade entirely — your plan says no longs below the 200 EMA and following rules consistently is the only way to test whether your plan has edge",
    "Enter with half position size as a reasonable compromise between the signal and the rule",
    "Enter long and move your stop immediately if price crosses the 200 EMA as confirmation"
  ],
  "correct_index": 1,
  "explanation": "A trading plan''s value comes entirely from consistent execution. If you override rules whenever a setup appears ''strong enough,'' you no longer have a testable plan — you are trading on discretion with extra steps. The 200 EMA filter exists specifically to prevent you from fighting the dominant trend structure. The same setup below the EMA will fail significantly more often than the same setup above it — that is the entire point of the filter. Every rule you break ''just this once'' erodes the statistical foundation your edge is built on. Pass, wait for alignment, take the next valid opportunity.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'building-your-trading-plan')
  AND slug = 'lesson-8';

-- trade-journalling / lesson-5
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "After reviewing 30 journal entries, you notice your average winning trade is +1.9R but your average losing trade is -1.5R — not -1.0R as your plan specifies. Your plan says: always honour the stop at -1.0R. What does this data reveal and what action is required?",
  "options": [
    "This is acceptable — a -1.5R average loss still means the strategy could be profitable if the win rate is high enough",
    "Your stops are being moved or ignored under pressure, directly violating your plan and destroying the edge you tested. Fix stop discipline immediately — use hard stop orders, not mental stops",
    "Widen your official stop loss rule to -1.5R to match your actual execution behaviour",
    "The data shows the strategy naturally needs more room — your original -1.0R stop was too tight"
  ],
  "correct_index": 1,
  "explanation": "If your plan says -1.0R but you''re actually losing -1.5R on average, you are moving stops under pressure — a classic emotional override that distorts your entire tested system. A strategy profitable at -1.0R average loss may become unprofitable at -1.5R. The journal caught this precisely because you were tracking systematically. The fix: convert all stops to hard orders placed immediately on entry, physically preventing you from moving them. Mental stops under drawdown pressure are almost always moved.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'trade-journalling')
  AND slug = 'lesson-5';

-- trade-journalling / lesson-7
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "GBPUSD",
  "timeframe": "H4",
  "exercise_prompt": "GBP/USD H4 shows a completed trade from your journal: you entered long at a support zone and were stopped out for a loss. Using the horizontal tool, draw a line at your entry price. This is the chart post-mortem — reviewing the decision visually. The exercise: was the support zone genuinely valid at the time of entry? What did price do AFTER your stop was hit? Did the setup have merit but poor timing, or was the entry itself flawed?",
  "reference_line": {"x1": 0, "y1": 57, "x2": 100, "y2": 57},
  "steps": [{"id":"1","label":"Draw your entry level","completed":false},{"id":"2","label":"Assess whether the level was valid","completed":false},{"id":"3","label":"Review the post-entry price action","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'trade-journalling')
  AND slug = 'lesson-7';


-- ══════════════════════════════════════════════════════════════════════════════
-- LEVEL 4 — THE ALLOCATOR
-- ══════════════════════════════════════════════════════════════════════════════

-- backtesting-and-statistics / lesson-8
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "EURUSD",
  "timeframe": "D1",
  "exercise_prompt": "EUR/USD Daily bar-by-bar replay is shown. A bullish engulfing candle has just formed and closed at a key support level — your backtest setup triggered. Your rules: enter on the next candle open, stop below the engulfing candle low, target 2R. Using the horizontal tool, draw a line at your entry price — the open of the candle immediately following the signal candle. This is how a live backtest trade is logged: exact entry, not approximation.",
  "reference_line": {"x1": 50, "y1": 47, "x2": 100, "y2": 47},
  "steps": [{"id":"1","label":"Identify the signal candle","completed":false},{"id":"2","label":"Draw the entry price (next open)","completed":false},{"id":"3","label":"Review backtest accuracy","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'backtesting-and-statistics')
  AND slug = 'lesson-8';

-- backtesting-and-statistics / lesson-9
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "Strategy A: 47% win rate, average 2.1R winner, average 1.0R loser, 100 trades tested in-sample. Strategy B: 68% win rate, average 0.7R winner, average 1.0R loser, 40 trades tested in-sample. Which would you choose to trade live and why?",
  "options": [
    "Strategy B — a 68% win rate is psychologically easier to trade through losing runs",
    "Strategy A — it has higher expectancy (+0.46R vs +0.14R per trade), a larger and more statistically significant sample, and a superior R:R that is more forgiving of real-world execution slippage",
    "Strategy B — higher win rate strategies require less skill to backtest correctly",
    "Neither — 100 trades is too small a sample for any strategy to be considered statistically valid"
  ],
  "correct_index": 1,
  "explanation": "Strategy A expectancy = (0.47 × 2.1) − (0.53 × 1.0) = 0.987 − 0.53 = +0.457R per trade. Strategy B expectancy = (0.68 × 0.7) − (0.32 × 1.0) = 0.476 − 0.32 = +0.156R per trade. Strategy A wins on three dimensions: (1) expectancy is 3× higher, (2) 100 trades provides far more statistical significance than 40 — at 40 trades a 68% win rate has a very wide confidence interval and could easily be 55% with more data, (3) a 2.1R:1.0R ratio is more robust to slippage and spread than a 0.7R:1.0R ratio. 100 trades is a reasonable minimum, not too small.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'backtesting-and-statistics')
  AND slug = 'lesson-9';

-- algorithmic-thinking / lesson-5
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "EURUSD",
  "timeframe": "H4",
  "exercise_prompt": "EUR/USD H4 is at a key resistance zone. Your trading plan''s decision tree for a short setup: IF price reaches resistance AND a bearish rejection candle forms, THEN enter short below the candle close. Using the horizontal tool, draw the entry trigger level — the exact price at which the ''close below this level'' condition is met. This is the leaf node of your decision tree: price crossing this line fires the entry.",
  "reference_line": {"x1": 50, "y1": 37, "x2": 100, "y2": 37},
  "steps": [{"id":"1","label":"Identify the resistance zone","completed":false},{"id":"2","label":"Draw the IF-THEN entry trigger","completed":false},{"id":"3","label":"Review decision tree accuracy","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'algorithmic-thinking')
  AND slug = 'lesson-5';

-- algorithmic-thinking / lesson-8
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "You backtest a 20/50 EMA crossover strategy on 5 years of EUR/USD daily data. Default settings: Profit Factor 1.45, Max DD 18%. You optimise it to 19/47: Profit Factor 1.89, Max DD 12% in-sample. Running the 19/47 settings on an untouched out-of-sample year: Profit Factor 0.88. What does this tell you?",
  "options": [
    "The 19/47 settings are superior — in-sample profit factor of 1.89 proves this definitively",
    "The 19/47 settings are overfit. Superior in-sample performance that collapses out-of-sample is the definition of curve-fitting — the parameters were tuned to historical noise, not genuine edge",
    "Out-of-sample testing is unreliable and should be weighted less than in-sample results",
    "Both settings are overfit because EMA crossovers have no edge in any market"
  ],
  "correct_index": 1,
  "explanation": "Overfitting (curve-fitting) occurs when parameters are tuned to the specific characteristics of the historical data rather than capturing a genuine market inefficiency. The hallmark is in-sample performance that looks excellent but degrades sharply out-of-sample. Here, 19/47 ''found'' a better-fitting curve to 5 years of data, but that exact fit didn''t generalise. The correct approach: use logically-motivated parameters (round numbers, not micro-optimised values), test multiple out-of-sample windows, and treat any strategy that shows major in-sample vs out-of-sample divergence as overfit until proven otherwise.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'algorithmic-thinking')
  AND slug = 'lesson-8';

-- options-fundamentals / lesson-7
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "You buy a call option on a stock: strike price $180, premium paid $5.00, stock price at expiry $191. What is your profit or loss per share at expiry?",
  "options": [
    "Loss of $5.00 — the premium is always lost regardless of price movement",
    "Profit of $6.00 — intrinsic value at expiry ($191 − $180 = $11) minus the $5 premium paid = $6",
    "Profit of $11.00 — the intrinsic value at expiry without accounting for premium cost",
    "Loss of $14.00 — buying calls above the strike price is always a loss"
  ],
  "correct_index": 1,
  "explanation": "At expiry, a call option has intrinsic value equal to max(Stock Price − Strike, 0). Here: $191 − $180 = $11 intrinsic value. Your net P&L = Intrinsic Value − Premium Paid = $11 − $5 = $6 profit per share. Break-even = Strike + Premium = $180 + $5 = $185. Any stock price above $185 generates profit; below $185 you lose part or all of the $5 premium. Maximum loss is always capped at the premium paid ($5), which is the defined-risk advantage of buying options versus being long the stock.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'options-fundamentals')
  AND slug = 'lesson-7';

-- trading-economic-events / lesson-7
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "EURUSD",
  "timeframe": "H1",
  "exercise_prompt": "EUR/USD H1 is shown 2 hours before a high-impact NFP release. You currently hold a long position entered earlier at a key support level and are sitting on a 45-pip profit. Using the horizontal tool, draw the level at which you would take partial or full profit BEFORE the news release — protecting the gain from unpredictable post-NFP volatility. This level should represent a sensible technical exit, not a panic close.",
  "reference_line": {"x1": 0, "y1": 37, "x2": 100, "y2": 37},
  "steps": [{"id":"1","label":"Assess the current profit position","completed":false},{"id":"2","label":"Draw your pre-news profit protection level","completed":false},{"id":"3","label":"Review risk management decision","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'trading-economic-events')
  AND slug = 'lesson-7';

-- trading-economic-events / lesson-9
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "The Fed just delivered a rate hike of 0.25%. However, the market had priced in a 0.50% hike based on prior Fed communication. EUR/USD initially drops 35 pips, then reverses and rallies 110 pips within the next hour. What explains this seemingly counterintuitive reaction?",
  "options": [
    "Rate hikes always cause EUR/USD to rally after the initial knee-jerk drop — this is a known seasonal pattern",
    "The Fed delivered a smaller hike than expected — relative to the 0.50% consensus, a 0.25% hike is a dovish surprise that weakens the dollar. Markets trade the gap between expectations and reality, not the headline number alone",
    "The initial drop was the correct reaction; the subsequent rally was caused by retail traders buying the dip incorrectly",
    "EUR/USD always reverses after FOMC statements due to liquidity dynamics regardless of the decision"
  ],
  "correct_index": 1,
  "explanation": "Currency and asset markets price in expectations continuously. If the consensus was 0.50% and the Fed delivered 0.25%, the dollar is ''less hawkish than feared'' — a relative dovish outcome. This is the ''buy the rumour, sell the fact'' dynamic in reverse: the market sold dollars in anticipation of a larger hike that didn''t materialise. Before any major release, knowing the consensus expectation is as important as knowing the outcome. A ''good'' number that is below the consensus can cause the opposite reaction — and this is exactly what experienced macro traders position around.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'trading-economic-events')
  AND slug = 'lesson-9';

-- portfolio-and-advanced-risk / lesson-7
UPDATE lessons SET content = '{
  "activity_type": "calculation",
  "problem": "A trading strategy over 12 months produced monthly returns with an average of +3.2% and a standard deviation of 4.1%. The risk-free rate is 5% per year (0.417% per month). Sharpe Ratio = (Average Monthly Return − Monthly Risk-Free Rate) ÷ Standard Deviation of Monthly Returns. Calculate the monthly Sharpe Ratio to 2 decimal places.",
  "correct_answer": "0.68",
  "tolerance": 0.05,
  "unit": "(dimensionless ratio)",
  "hint": "Excess return = Average return minus risk-free rate. Then divide by the standard deviation.",
  "solution_steps": [
    "Monthly risk-free rate = 5% ÷ 12 = 0.417%",
    "Excess monthly return = 3.2% − 0.417% = 2.783%",
    "Sharpe Ratio = 2.783 ÷ 4.1 = 0.679 ≈ 0.68",
    "Interpretation: 0.68 means you earn 0.68 units of excess return per unit of risk taken.",
    "Benchmarks: below 1.0 is acceptable, above 1.0 is good, above 2.0 is excellent for a trading strategy."
  ],
  "steps": [{"id":"1","label":"Calculate excess return","completed":false},{"id":"2","label":"Divide by standard deviation","completed":false},{"id":"3","label":"Review interpretation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'portfolio-and-advanced-risk')
  AND slug = 'lesson-7';

-- portfolio-and-advanced-risk / lesson-8
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "You have three open positions each sized to 1% account risk: Long GBP/USD, Long EUR/USD, Long AUD/USD. What is your true combined USD exposure risk — and why is it not simply 3%?",
  "options": [
    "Exactly 3% — each position is independently sized to 1% risk, so the total is 1 + 1 + 1 = 3%",
    "Effectively much more than 3% — all three positions are long non-USD currencies versus the dollar. A sudden USD strengthening event (surprise Fed hawkishness, risk-off) hits all three simultaneously, creating correlated losses that can exceed 6–8% of account in a single dollar move",
    "Exactly 2% — EUR/USD and GBP/USD are correlated so they count as one 1% position plus the AUD/USD",
    "Effectively 0% net risk — long GBP/USD partially hedges short USD exposure from the other pairs"
  ],
  "correct_index": 1,
  "explanation": "Correlation risk is one of the most underappreciated dangers in retail trading. GBP/USD, EUR/USD, and AUD/USD all carry strong negative correlation with USD strength (typically -0.75 to -0.90). In a strong dollar event — Fed surprise, geopolitical risk-off — all three positions move against you simultaneously. Your three ''independent'' 1% risks become a single directional USD bet with combined exposure of 3–8% in one move. The rule: never hold multiple positions with the same directional exposure without consciously acknowledging the real aggregate risk. Evaluate total USD exposure, not just per-position risk.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'portfolio-and-advanced-risk')
  AND slug = 'lesson-8';

-- prop-firm-preparation / lesson-5
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "On Day 3 of your prop firm challenge you have made 2.4% profit. You take a trade that immediately goes against you and hits your maximum daily loss limit. You have 7 days remaining in the challenge. What is the correct action?",
  "options": [
    "Trade through the rest of the day cautiously to try to recover some of the daily loss before tomorrow",
    "Stop trading immediately for the day — prop firm daily loss limits are hard rules with no exceptions. Breaching them fails the challenge. Protect the 2.4% gained and trade fresh tomorrow",
    "Switch to a smaller position size to continue trading but stay under the limit",
    "Close all trades and wait until market volatility drops before attempting more trades today"
  ],
  "correct_index": 1,
  "explanation": "Prop firm daily loss limits are the single most common reason funded traders lose their accounts. The rule has zero exceptions: once you hit the daily limit, your trading day ends. With 2.4% profit and 7 days remaining, you are in a strong position — protecting that gain is far more valuable than attempting to trade a compromised session after hitting your limit. Professional prop traders treat daily loss limits as hard circuit breakers. The moment the limit is reached: log off, do the post-session review, and return tomorrow with fresh capital and a clear head.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'prop-firm-preparation')
  AND slug = 'lesson-5';

-- prop-firm-preparation / lesson-8
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "A prop firm challenge requires: 10% profit target, 5% daily loss limit, 10% max drawdown. You are at 7.5% profit with 3 days remaining. Your next setup has a stop loss that risks 3% of the account. Should you take it?",
  "options": [
    "Yes — you are near the profit target and this trade could get you there in one move",
    "No — risking 3% on a single trade when you are 3 days from the finish with 7.5% profit violates the core principle of capital preservation in a challenge. Size down to 0.5–1% risk maximum when near the target",
    "Yes — larger position sizes reduce the number of trades needed and therefore reduce cumulative risk",
    "No — you should never trade in the last 3 days of a challenge regardless of your position"
  ],
  "correct_index": 1,
  "explanation": "The closer you are to a prop firm challenge target, the more you should reduce position size — not increase it. With 7.5% profit and only 2.5% needed to pass, a single 3% risk trade is irrational: a loss drops you to 4.5% and you need a 5.5% recovery in 3 days, while a win gives only marginal improvement in an already strong position. The professional approach: when 75%+ through the target, reduce risk to 0.5–1% per trade. Protect the gain. Let the trades come to you. Greed in the final stretch is the #1 way skilled traders fail challenges they should pass.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'prop-firm-preparation')
  AND slug = 'lesson-8';


-- ══════════════════════════════════════════════════════════════════════════════
-- LEVEL 5 — THE TACTICIAN
-- ══════════════════════════════════════════════════════════════════════════════

-- order-flow-microstructure / lesson-5
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "NAS100 is testing a major support level for the third time. Each time price touches the level, the bid side of the order book shows a large cluster of orders (''stacked bids'') that are absorbed — buyers are consuming sell pressure without price falling. The subsequent reaction each time is a 40+ point bounce. What is this behaviour called and what does it signal?",
  "options": [
    "Distribution — institutional sellers are absorbing retail buying and preparing to push price lower",
    "Absorption at support — large buyers are defending the level by consuming sell orders. The repeated inability of sellers to push through despite multiple tests signals strong institutional demand at this price",
    "Volume profile point of control — this is simply the most traded price level and has no directional significance",
    "A bear trap setup — the stacked bids are fake liquidity designed to lure buyers before a sharp sell-off"
  ],
  "correct_index": 1,
  "explanation": "Absorption occurs when a large participant systematically takes the opposing side of incoming orders to defend a price level. At support, an absorbing buyer takes every sell order that hits the level — large bid volume is ''consumed'' without price breaking lower. Three tests with identical absorption behaviour and 40+ point bounces each time indicates genuine institutional interest at this level. This is one of the core concepts in order flow analysis: price held not by absence of sellers, but by active, large-scale buying that overwhelms the selling pressure.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'order-flow-microstructure')
  AND slug = 'lesson-5';

-- order-flow-microstructure / lesson-8
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "On a EUR/USD 5-minute footprint chart, the delta (buy volume minus sell volume) on three consecutive candles is: −8,400, −9,200, −7,800 (heavily negative — net selling dominating). Yet price during this period rose 15 pips. What does this divergence between price and delta signal?",
  "options": [
    "The delta readings are inaccurate — when price rises, delta must be positive by definition",
    "Bearish divergence (negative delta, rising price) suggests the upward price move is being driven by thin offer-side liquidity rather than genuine buying conviction. A reversal is likely when this supply gets absorbed",
    "Bullish confirmation — rising price always takes precedence over delta in footprint analysis",
    "This indicates a technical glitch in the footprint data and should be ignored"
  ],
  "correct_index": 1,
  "explanation": "Delta-price divergence is a key signal in footprint analysis. Normally, rising price accompanies positive delta (net buying). When price rises despite strongly negative delta, it means sellers are initiating trades but price is being held up — potentially by a large passive buyer absorbing all the selling at the offer. This is ''buying absorption'' from the offer side. The weak buying pressure driving price up (thin offers) is not backed by genuine conviction. When the passive buyer steps back, sellers who have been accumulating short delta positions can push price down aggressively. This is an advanced but high-precision reversal signal.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'order-flow-microstructure')
  AND slug = 'lesson-8';

-- execution-mastery / lesson-5
UPDATE lessons SET content = '{
  "activity_type": "multi_choice",
  "question": "A GBP/USD long setup has triggered at daily support. You have three entry options: (A) market order now at 1.2720 — spread 1.5 pips, (B) limit order to buy at the exact support level 1.2700 — spread 0 (already at level), (C) limit order above the 15-minute candle high at 1.2728 — waiting for 15-min confirmation before entering. Your stop loss is 40 pips below entry for all three. Which method gives the best R:R after accounting for entry cost?",
  "options": [
    "Option A — market order immediately, ensuring you don''t miss the move. The 1.5 pip spread is negligible",
    "Option B — limit at the level gives the best entry price and therefore the widest R:R, though it may not fill if price bounces without touching it",
    "Option C — the 15-minute confirmation reduces false entries; the 8-pip cost is worthwhile for the signal quality improvement",
    "All three are equivalent — entry method doesn''t materially affect long-term performance"
  ],
  "correct_index": 1,
  "explanation": "Option B (limit at the level) gives the best R:R if filled: you enter at the precise support with zero entry cost above the level. The trade-off is fill risk — if price bounces without touching your limit, you miss the trade. Option A gets you in immediately but 1.5 pips higher than B, slightly reducing R:R. Option C enters 8 pips above the level for confirmation — meaningful cost on a 40-pip stop setup (reduces R:R by roughly 0.2R). The choice depends on your strategy''s fill rate tolerance. Professionals often use limit orders at key levels for precisely this reason — better average entry price compounds significantly over hundreds of trades.",
  "steps": [{"id":"1","label":"Read the question","completed":false},{"id":"2","label":"Select your answer","completed":false},{"id":"3","label":"Review explanation","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'execution-mastery')
  AND slug = 'lesson-5';

-- scaling-positions / lesson-5
UPDATE lessons SET content = '{
  "activity_type": "draw_horizontal",
  "ticker": "GBPUSD",
  "timeframe": "H4",
  "exercise_prompt": "You entered long GBP/USD H4 at the marked entry level and price has moved 80 pips in your favour. Your original plan was a 120-pip target. Using the horizontal tool, draw your partial profit level — the price where you will take 50% of the position off (securing gains) and move your stop to break-even on the remaining 50%. This partial exit converts a full-risk trade into a risk-free runner.",
  "reference_line": {"x1": 20, "y1": 42, "x2": 100, "y2": 42},
  "steps": [{"id":"1","label":"Identify 50-80% of target distance","completed":false},{"id":"2","label":"Draw your partial profit level","completed":false},{"id":"3","label":"Review scaling logic","completed":false}]
}'::jsonb
WHERE course_id = (SELECT id FROM courses WHERE slug = 'scaling-positions')
  AND slug = 'lesson-5';

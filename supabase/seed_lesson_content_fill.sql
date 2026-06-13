-- Tradecuity: Fill remaining lessons to match lesson_count metadata (Levels 5–10)
-- Run AFTER seed_levels_5_10.sql
-- Safe to re-run: ON CONFLICT (course_id,slug) DO NOTHING

-- ══════════════════════════════════════════════════════════════════════════════
-- LEVEL 5: THE TACTICIAN
-- ══════════════════════════════════════════════════════════════════════════════

-- order-flow-microstructure: seeded 8, target 16 → add 9–16
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-9', 'Delta Divergence: When Price Contradicts Aggression',9,'reading',40,NULL::jsonb),
  ('lesson-10','VWAP and Institutional Order Routing',10,'reading',40,NULL::jsonb),
  ('lesson-11','Dark Pools: What Off-Exchange Volume Reveals',11,'video',40,NULL::jsonb),
  ('lesson-12','How HFT Firms Exploit Predictable Flow',12,'reading',40,NULL::jsonb),
  ('lesson-13','VWAP Rejection and Reclaim Setups',13,'canvas_exercise',60,
   '{"ticker":"NAS100","timeframe":"M5","exercise_prompt":"NAS100 5-minute chart with VWAP displayed. The market opens below VWAP. Draw: (1) the first candle closing back above VWAP as your long entry, (2) stop below the prior swing low, (3) target at the session high. Then find a VWAP rejection candle from above and mark a short entry arrow at that bar.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Mark VWAP reclaim entry","completed":false},{"id":"2","label":"Set stop and target","completed":false},{"id":"3","label":"Mark VWAP rejection short","completed":false}]}'::jsonb),
  ('lesson-14','The Auction Process: How Price Finds Fair Value',14,'reading',40,NULL::jsonb),
  ('lesson-15','Market Profile: Volume Distribution by Price Level',15,'video',40,NULL::jsonb),
  ('lesson-16','Order Flow Capstone: Read an Entire Session',16,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"M1","exercise_prompt":"Full London open EUR/USD session shown on 1-minute footprint charts. Using delta, tape, and VWAP together: (1) circle the absorption zone that preceded the trend move, (2) mark the stop hunt candle with an X, (3) draw your entry arrow with stop and target. This is the capstone exercise for the order flow course.","reference_line":{"x1":25,"y1":65,"x2":100,"y2":30},"steps":[{"id":"1","label":"Identify absorption zone","completed":false},{"id":"2","label":"Mark the stop hunt","completed":false},{"id":"3","label":"Draw entry, stop, and target","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='order-flow-microstructure' ON CONFLICT (course_id,slug) DO NOTHING;

-- execution-mastery: seeded 6, target 14 → add 7–14
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Post-Only and Hidden Orders: Advanced Limit Strategies',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Execution in Fast Markets: NFP, FOMC, and Open Conditions',8,'video',40,NULL::jsonb),
  ('lesson-9', 'The True Cost of Impatience: A 50-Trade Market Order Study',9,'reading',40,NULL::jsonb),
  ('lesson-10','Broker Selection: What Actually Matters for Your Strategy',10,'reading',40,NULL::jsonb),
  ('lesson-11','Transaction Cost Analysis: Measuring Execution Drag',11,'reading',40,NULL::jsonb),
  ('lesson-12','Optimise Entry Timing Across Session Windows',12,'canvas_exercise',60,
   '{"ticker":"GBPUSD","timeframe":"M15","exercise_prompt":"Three session windows are highlighted on the GBP/USD chart: pre-London (grey), London open (blue), and NY-London overlap (green). For the same trend setup appearing in each window, draw the entry, stop, and target. Calculate slippage-adjusted R:R for each window using the spread data shown. Which window gives the best net R:R after execution costs?","reference_line":{"x1":0,"y1":55,"x2":100,"y2":55},"steps":[{"id":"1","label":"Draw entries across three windows","completed":false},{"id":"2","label":"Calculate slippage-adjusted R:R","completed":false},{"id":"3","label":"Identify best execution window","completed":false}]}'::jsonb),
  ('lesson-13','Pre-Trade Checklist: Conditions That Kill Good Setups',13,'reading',40,NULL::jsonb),
  ('lesson-14','Execution Audit: Review Your Last 30 Trades for Avoidable Drag',14,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"H1","exercise_prompt":"A 30-trade performance log is shown. Each trade has an entry method: market order (orange dot) or limit order (blue dot). Draw two separate mini equity curves — one for market order entries, one for limit order entries. Calculate the average slippage cost per trade for each method. Which approach improved your net expectancy, and by how much?","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Separate trades by entry method","completed":false},{"id":"2","label":"Draw two equity curves","completed":false},{"id":"3","label":"Calculate slippage difference","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='execution-mastery' ON CONFLICT (course_id,slug) DO NOTHING;

-- scaling-positions: seeded 6, target 13 → add 7–13
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'The Pyramid: Adding Size as Price Proves Your Thesis',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Scale-Out Strategies: Fixed Targets vs Trailing Exits',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'The R-Multiple Framework for Measuring Trade Quality',9,'video',40,NULL::jsonb),
  ('lesson-10','Position Management Across Trending vs Ranging Markets',10,'reading',40,NULL::jsonb),
  ('lesson-11','Scale Into a Pyramid on a Running Trend',11,'canvas_exercise',60,
   '{"ticker":"USDJPY","timeframe":"H4","exercise_prompt":"USD/JPY is in a strong uptrend. You entered the first position at the marked level. Draw: (1) your second entry after price consolidates and breaks to a new high, (2) your third entry on the next breakout, (3) your stop loss for each entry (each trailed to the last consolidation low), (4) the single blended exit level where you close all three positions. Calculate the blended R on the whole trade.","reference_line":{"x1":0,"y1":70,"x2":100,"y2":20},"steps":[{"id":"1","label":"Draw three pyramid entries","completed":false},{"id":"2","label":"Trail stops for each leg","completed":false},{"id":"3","label":"Calculate blended R:R","completed":false}]}'::jsonb),
  ('lesson-12','Emergency Sizing When a Market Gaps Against You',12,'reading',40,NULL::jsonb),
  ('lesson-13','Case Study: Great Entries Ruined by Poor Management',13,'reading',40,NULL::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='scaling-positions' ON CONFLICT (course_id,slug) DO NOTHING;

-- session-edge: seeded 6, target 12 → add 7–12
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'The Asian Session: Range-Building and Liquidity Setup',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Pre-Market Analysis: Setting Your Daily Directional Bias',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'London-New York Overlap: The Highest Edge Window of the Week',9,'video',40,NULL::jsonb),
  ('lesson-10','Day-of-Week Patterns: Which Days Trend vs Which Days Chop',10,'reading',40,NULL::jsonb),
  ('lesson-11','Fade the Fake London Open',11,'canvas_exercise',60,
   '{"ticker":"GBPUSD","timeframe":"M15","exercise_prompt":"GBP/USD chart shows a sharp London open spike above the Asian high. The move reverses within 3 candles and closes back inside the Asian range. Draw: (1) your fade entry — the candle that closes back below the Asian high, (2) your stop above the spike high, (3) a target at the Asian session midpoint. This is the fake open pattern. Calculate R:R.","reference_line":{"x1":60,"y1":25,"x2":100,"y2":55},"steps":[{"id":"1","label":"Identify the fake breakout","completed":false},{"id":"2","label":"Draw fade entry and stop","completed":false},{"id":"3","label":"Set target and calculate R:R","completed":false}]}'::jsonb),
  ('lesson-12','End-of-Month and Quarterly Rebalancing Flows',12,'reading',40,NULL::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='session-edge' ON CONFLICT (course_id,slug) DO NOTHING;

-- advanced-dynamic-risk: seeded 6, target 14 → add 7–14
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'MAE Analysis: Your Stop Is Probably Too Wide or Too Tight',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Expected Value: The Math Behind Every Sizing Decision',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Correlated Positions: Sizing for True Portfolio Exposure',9,'video',40,NULL::jsonb),
  ('lesson-10','Risk Budgeting: Setting Daily, Weekly, and Monthly Loss Limits',10,'reading',40,NULL::jsonb),
  ('lesson-11','Stress Test Your Sizing Model',11,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"Your trading account has a 10% max drawdown rule. A losing streak of 7 trades is shown. At each loss, draw a horizontal line showing your recalculated position size under three models: (A) fixed 1% risk, (B) dynamic sizing that reduces by 25% after each 3% drawdown, (C) half-Kelly floor. Which model keeps you furthest from the 10% limit and best preserves capital for the recovery?","reference_line":{"x1":0,"y1":70,"x2":100,"y2":30},"steps":[{"id":"1","label":"Plot sizes for all three models","completed":false},{"id":"2","label":"Mark drawdown threshold crossings","completed":false},{"id":"3","label":"Select optimal model with justification","completed":false}]}'::jsonb),
  ('lesson-12','The Psychology of Risk: Why Traders Break Their Own Rules',12,'reading',40,NULL::jsonb),
  ('lesson-13','Building a Personal Risk Dashboard',13,'reading',40,NULL::jsonb),
  ('lesson-14','Quarterly Risk Review: What Your Numbers Actually Tell You',14,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"A quarterly trade log is displayed with 42 trades. Panel A shows your intended risk per trade (blue bar) vs actual risk taken (orange bar). Panel B shows daily P&L. Draw a circle around every trade where you deviated from your risk rules by more than 50%. Count the deviations. Then draw two equity curves: one using your actual trades, one recalculated using your intended risk rules. Which curve looks better, and by how much?","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Identify rule deviations","completed":false},{"id":"2","label":"Draw actual vs rules-based equity curves","completed":false},{"id":"3","label":"Quantify the cost of deviating","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='advanced-dynamic-risk' ON CONFLICT (course_id,slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════════
-- LEVEL 6: THE QUANT
-- ══════════════════════════════════════════════════════════════════════════════

-- systematic-strategy-design: seeded 7, target 18 → add 8–18
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-8', 'Entry Logic: Writing Exact Conditions in Plain Language',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Stop Loss Rules: Fixed, ATR-Based, and Structure-Based',9,'reading',40,NULL::jsonb),
  ('lesson-10','Profit Target Rules: Fixed R, Trailing, and Time-Based Exits',10,'video',40,NULL::jsonb),
  ('lesson-11','Parameter Selection: Choosing Values That Survive Future Markets',11,'reading',40,NULL::jsonb),
  ('lesson-12','Transaction Cost Modelling in Backtests',12,'reading',40,NULL::jsonb),
  ('lesson-13','Build a Strategy Rule Set from Scratch',13,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"Formalise the following discretionary idea into a testable system: ''I go long when price closes above a 20-day high and the ADX is above 25.'' Draw the 20-day high channel on the chart. Mark every entry signal in the last 12 months with a vertical line. Then for each, mark the exit at a 10-day low close. Count wins and losses. Write the full rule set (universe, entry, stop, exit, sizing) in the text box.","reference_line":{"x1":0,"y1":40,"x2":100,"y2":35},"steps":[{"id":"1","label":"Define all five system components","completed":false},{"id":"2","label":"Mark historical entry signals","completed":false},{"id":"3","label":"Calculate preliminary win rate","completed":false}]}'::jsonb),
  ('lesson-14','Position Sizing Rules for Systematic Strategies',14,'reading',40,NULL::jsonb),
  ('lesson-15','Robustness Checks: Confirming Your Results Are Real',15,'reading',40,NULL::jsonb),
  ('lesson-16','Monte Carlo Simulation: Mapping the Range of Outcomes',16,'video',40,NULL::jsonb),
  ('lesson-17','Strategy Monitoring: Catching Drift Before It Becomes Disaster',17,'reading',40,NULL::jsonb),
  ('lesson-18','Capstone: From Discretionary Idea to Live Systematic Strategy',18,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"Your strategy has been backtested over 5 years. Five performance panels are shown: equity curve, monthly returns heatmap, drawdown chart, trade distribution histogram, and MAE/MFE scatter. Draw a circle around any panel that shows a warning sign (e.g., clustering of losses in one regime, outsized single trade, long underwater periods). For each warning, write one sentence explaining what it means and what you would change in the rules to address it.","reference_line":{"x1":0,"y1":40,"x2":100,"y2":40},"steps":[{"id":"1","label":"Identify warning signs in each panel","completed":false},{"id":"2","label":"Diagnose each warning","completed":false},{"id":"3","label":"Propose rule changes","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='systematic-strategy-design' ON CONFLICT (course_id,slug) DO NOTHING;

-- data-analysis-for-traders: seeded 5, target 14 → add 6–14
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-6', 'MAE and MFE: Mining Your Trade History for Hidden Edge',6,'reading',40,NULL::jsonb),
  ('lesson-7', 'Win Rate vs Payoff Ratio: Finding Your Natural Trading Style',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Time-of-Day Analysis: When Does Your Strategy Actually Work?',8,'video',40,NULL::jsonb),
  ('lesson-9', 'Correlation Between Your Setups: Are They All the Same Trade?',9,'reading',40,NULL::jsonb),
  ('lesson-10','Statistical Significance: How Many Trades Before You Can Trust the Data?',10,'reading',40,NULL::jsonb),
  ('lesson-11','Filter for Genuine Patterns in Your Trade History',11,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"A 90-trade history is shown with each trade tagged by three attributes: session (London/NY/Asia), day of week (Mon-Fri), and setup type (breakout/pullback/reversal). Use the filter panel to isolate your most profitable subset. Draw the equity curve for (A) all trades, (B) London session only, (C) London pullback trades only. Calculate Sharpe for each subset. Does filtering improve your edge meaningfully?","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Filter by session and setup type","completed":false},{"id":"2","label":"Draw three equity curves","completed":false},{"id":"3","label":"Compare Sharpe ratios","completed":false}]}'::jsonb),
  ('lesson-12','Removing Outliers: Performance Without Your Best 5 Trades',12,'reading',40,NULL::jsonb),
  ('lesson-13','Building a Personal Trade Statistics Dashboard',13,'reading',40,NULL::jsonb),
  ('lesson-14','Quarterly Review: What to Change and What to Leave Alone',14,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"Three months of performance data are shown across five metrics: win rate, average R, Sharpe, max drawdown, and streak stats. Month 1 is highlighted as your best. Month 3 is your worst. Draw a bar chart comparing all five metrics across the three months. Identify the single metric that changed most between Month 1 and Month 3. Write one hypothesis for why it changed and one rule change you would test next quarter.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Draw five-metric comparison chart","completed":false},{"id":"2","label":"Identify biggest metric change","completed":false},{"id":"3","label":"Write hypothesis and rule change","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='data-analysis-for-traders' ON CONFLICT (course_id,slug) DO NOTHING;

-- walk-forward-robustness: seeded 6, target 15 → add 7–15
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Sensitivity Analysis: Small Parameter Changes, Large Performance Impact?',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Multiple Testing Bias: The More You Test, the Less You Can Trust',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'What to Do When Your Strategy Fails Walk-Forward',9,'video',40,NULL::jsonb),
  ('lesson-10','Comparing Multiple Strategies Under Walk-Forward',10,'reading',40,NULL::jsonb),
  ('lesson-11','Regime-Conditional Walk-Forward: Does Filtering by Regime Help?',11,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"A trend-following strategy is walk-forward tested across 5 years. The parameter stability chart is shown. In the left panel, draw a line connecting the optimal fast EMA period across each annual window. In the right panel, filter the same test to only trending regimes (ADX>25). Does the optimal parameter become more stable when you filter by regime? Draw both lines and compare the variance.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Plot parameter stability unfiltered","completed":false},{"id":"2","label":"Plot parameter stability regime-filtered","completed":false},{"id":"3","label":"Assess whether regime filter improves robustness","completed":false}]}'::jsonb),
  ('lesson-12','Practical Walk-Forward Without Code: Spreadsheet Methods',12,'reading',40,NULL::jsonb),
  ('lesson-13','Reporting Walk-Forward Results: What Good Looks Like',13,'reading',40,NULL::jsonb),
  ('lesson-14','Continuous Walk-Forward in Live Trading: Re-Optimisation Schedules',14,'reading',40,NULL::jsonb),
  ('lesson-15','Walk-Forward Final Assessment: Your Strategy Under the Microscope',15,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"Your complete strategy walk-forward results are shown across 6 annual windows. For each window: the in-sample optimal parameters are shown in blue, the out-of-sample performance using those parameters is shown in orange. Draw a waterfall chart: for each window show the degradation from in-sample to out-of-sample Sharpe as a downward bar. Calculate the average walk-forward efficiency ratio. Is your strategy above the 0.5 threshold that indicates deployable robustness?","reference_line":{"x1":0,"y1":60,"x2":100,"y2":40},"steps":[{"id":"1","label":"Draw in-sample vs OOS performance bars","completed":false},{"id":"2","label":"Calculate walk-forward efficiency ratio","completed":false},{"id":"3","label":"Make deployment decision","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='walk-forward-robustness' ON CONFLICT (course_id,slug) DO NOTHING;

-- market-regimes: seeded 6, target 14 → add 7–14
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Regime Persistence: How Long Do Regimes Last on Average?',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Multi-Asset Regime Confirmation: Equities, Bonds, and Commodities',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Early Warning Signals of Regime Change',9,'video',40,NULL::jsonb),
  ('lesson-10','Implied Volatility as a Regime Classification Tool',10,'reading',40,NULL::jsonb),
  ('lesson-11','Position Sizing in Different Regimes',11,'reading',40,NULL::jsonb),
  ('lesson-12','Build a Live Regime Indicator Dashboard',12,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"Four regime indicators are displayed in panels below the EUR/USD daily chart: ADX (trend strength), Bollinger Band Width (squeeze detection), 20-day ATR percentile (volatility regime), and 50/200 EMA gap (directional bias). For each of the last 12 months, use all four indicators together to classify the regime. Draw a colour-coded bar below the price chart: green=trending, grey=ranging, orange=high vol. Where do your four indicators disagree? How do you resolve conflicts?","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Classify each month using four indicators","completed":false},{"id":"2","label":"Draw colour-coded regime bar","completed":false},{"id":"3","label":"Document conflict resolution rules","completed":false}]}'::jsonb),
  ('lesson-13','Portfolio Construction Across Regime States',13,'reading',40,NULL::jsonb),
  ('lesson-14','Regime-Adaptive Strategy Final Assessment',14,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"A trend-following strategy and a mean-reversion strategy are both shown running simultaneously on the same EUR/USD 3-year chart. A regime classification bar is shown below. Draw a capital allocation line showing how you shift between the two strategies as regime changes: more capital to trend-following in trending regimes, more to mean-reversion in ranging regimes. Calculate the blended Sharpe of your regime-adaptive approach vs running either strategy alone at full capital.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Draw dynamic capital allocation line","completed":false},{"id":"2","label":"Calculate blended equity curve","completed":false},{"id":"3","label":"Compare Sharpe vs single-strategy","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='market-regimes' ON CONFLICT (course_id,slug) DO NOTHING;

-- building-personal-system: seeded 6, target 18 → add 7–18
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Defining Your Universe, Time Horizon, and Instrument Set',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Signal Research: Finding Edges in Your Own Historical Data',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Building Your Entry, Exit, and Sizing Rules',9,'video',40,NULL::jsonb),
  ('lesson-10','Paper Trading Your System: The Mandatory 30-Trade Trial',10,'reading',40,NULL::jsonb),
  ('lesson-11','Evaluate Your Paper Trade Results',11,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"Your 30-trade paper trading trial is complete. Results are shown in a performance table. Draw: (1) the equity curve across all 30 trades, (2) a bar chart showing R per trade coloured green (win) or red (loss), (3) calculate win rate, average R, Sharpe (annualised from daily returns), and max drawdown. Compare these metrics to your pre-trial expectations. Is the system ready to go live, or does it need adjustments?","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Draw equity curve and R bar chart","completed":false},{"id":"2","label":"Calculate all four metrics","completed":false},{"id":"3","label":"Make go/no-go decision","completed":false}]}'::jsonb),
  ('lesson-12','Going Live: Start Small, Run the Full Process',12,'reading',40,NULL::jsonb),
  ('lesson-13','The First 90 Days: What to Monitor and What to Ignore',13,'reading',40,NULL::jsonb),
  ('lesson-14','When to Adjust vs When to Stay the Course',14,'reading',40,NULL::jsonb),
  ('lesson-15','Scaling Up: When Your System Has Earned It',15,'video',40,NULL::jsonb),
  ('lesson-16','System Evolution: Updating Without Breaking What Works',16,'reading',40,NULL::jsonb),
  ('lesson-17','Building a Second Complementary Strategy',17,'reading',40,NULL::jsonb),
  ('lesson-18','Final System Documentation and Career Review',18,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"Using the system builder, complete your full personal trading system document on the canvas: (1) write your edge statement in one sentence, (2) list your entry conditions, exit rules, and sizing formula, (3) draw the 12-month live equity curve (or paper trade equivalent), (4) mark the three moments where you were tempted to deviate and did not. This document is your trading plan — sign it.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Complete edge and rules statement","completed":false},{"id":"2","label":"Draw 12-month equity curve","completed":false},{"id":"3","label":"Mark discipline moments","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='building-personal-system' ON CONFLICT (course_id,slug) DO NOTHING;

-- statistical-arbitrage-intro: seeded 6, target 16 → add 7–16
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'The Engle-Granger Cointegration Test in Plain English',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Half-Life of Mean Reversion: How Quickly Does the Spread Close?',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Dollar Neutrality vs Beta Neutrality in Pairs Sizing',9,'video',40,NULL::jsonb),
  ('lesson-10','Monitoring a Live Pairs Trade: What to Watch',10,'reading',40,NULL::jsonb),
  ('lesson-11','Managing a Pairs Trade That Diverges Further',11,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"You are long GBP/USD and short EUR/USD as a pairs trade. The spread has moved 1.5 standard deviations against you (EUR/USD strengthening faster than GBP/USD). Three scenarios are shown: (A) add to the position at -2 SD, (B) hold and wait for mean reversion, (C) cut half the position now. Draw the expected P&L path for each scenario on the spread panel assuming (i) reversion occurs, (ii) the spread continues diverging. Which scenario has the best risk-adjusted outcome?","reference_line":{"x1":40,"y1":70,"x2":100,"y2":50},"steps":[{"id":"1","label":"Draw P&L path for each scenario","completed":false},{"id":"2","label":"Assess both reversion and divergence outcomes","completed":false},{"id":"3","label":"Select optimal response","completed":false}]}'::jsonb),
  ('lesson-12','Multi-Leg Stat Arb: Three or More Correlated Instruments',12,'reading',40,NULL::jsonb),
  ('lesson-13','Index vs Constituent Basket Arbitrage',13,'reading',40,NULL::jsonb),
  ('lesson-14','Building a Systematic Pairs Screener',14,'video',40,NULL::jsonb),
  ('lesson-15','Regime Risk in Stat Arb: When Correlations Break',15,'reading',40,NULL::jsonb),
  ('lesson-16','Statistical Arbitrage Final Assessment',16,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"Two historically cointegrated pairs are shown: the EUR/USD vs AUD/USD spread (blue) and the GBP/USD vs NZD/USD spread (orange). During a risk-off event, both spreads blow out simultaneously. Draw the spread panels for each pair showing the divergence. Calculate which pair reverts faster using the half-life tool. Which pair would you prioritise for re-entry and why? Mark your entry, stop, and target on the faster-reverting spread.","reference_line":{"x1":50,"y1":30,"x2":100,"y2":50},"steps":[{"id":"1","label":"Compare spread blow-out on both pairs","completed":false},{"id":"2","label":"Calculate half-life for each","completed":false},{"id":"3","label":"Mark entry on faster-reverting pair","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='statistical-arbitrage-intro' ON CONFLICT (course_id,slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════════
-- LEVEL 7: THE MACRO TRADER
-- ══════════════════════════════════════════════════════════════════════════════

-- global-macro-framework: seeded 6, target 16 → add 7–16
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'The Balance of Payments: Current Account and Capital Account Dynamics',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'The Credit Cycle: Private Debt and Its Asset Price Implications',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Commodity-Currency Linkages: AUD, CAD, and NZD',9,'video',40,NULL::jsonb),
  ('lesson-10','Emerging Market Sensitivity to Dollar Strength',10,'reading',40,NULL::jsonb),
  ('lesson-11','Leading vs Lagging Indicators: What Is Actually Predictive?',11,'reading',40,NULL::jsonb),
  ('lesson-12','Map a Capital Flow Thesis on a Currency Pair',12,'canvas_exercise',60,
   '{"ticker":"AUDUSD","timeframe":"W1","exercise_prompt":"The macro scenario: China PMI is contracting, iron ore prices are falling, and the RBA is on hold while the Fed is hiking. Draw on the AUD/USD weekly chart: (1) a large arrow showing your directional macro bias, (2) the technical level that would confirm the macro thesis is playing out in price, (3) the level that would invalidate it. Write a one-sentence thesis statement linking the macro driver to the currency move.","reference_line":{"x1":0,"y1":45,"x2":100,"y2":65},"steps":[{"id":"1","label":"State the macro driver in one sentence","completed":false},{"id":"2","label":"Draw directional bias arrow","completed":false},{"id":"3","label":"Mark confirmation and invalidation levels","completed":false}]}'::jsonb),
  ('lesson-13','The ISM and PMI: Reading Business Cycle Signals',13,'reading',40,NULL::jsonb),
  ('lesson-14','Macro Positioning in a Risk-Off Environment',14,'reading',40,NULL::jsonb),
  ('lesson-15','Macro Trade Entry: Combining Top-Down Thesis with Technical Timing',15,'video',40,NULL::jsonb),
  ('lesson-16','Build Your Weekly Macro Dashboard',16,'canvas_exercise',60,
   '{"ticker":"USDJPY","timeframe":"D1","exercise_prompt":"Using the dashboard builder, create your weekly macro review template: (1) draw a summary panel showing your current view on USD, EUR, JPY, and GBP with directional arrows, (2) mark the three most important data releases this week on a calendar panel, (3) draw the one trade that best expresses your macro thesis this week — entry, stop, and target on the USD/JPY daily chart. This template should take you 20 minutes every Sunday to complete.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":35},"steps":[{"id":"1","label":"Complete currency directional summary","completed":false},{"id":"2","label":"Mark key data release dates","completed":false},{"id":"3","label":"Draw the week''s top trade idea","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='global-macro-framework' ON CONFLICT (course_id,slug) DO NOTHING;

-- central-bank-playbooks: seeded 6, target 15 → add 7–15
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Decoding FOMC Minutes: Reading Between the Lines',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'The Dot Plot Deep Dive: How Market Expectations Shift',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Quantitative Easing and Tightening: Mechanics and Market Impact',9,'video',40,NULL::jsonb),
  ('lesson-10','Currency Implications of Divergent Central Bank Policy',10,'reading',40,NULL::jsonb),
  ('lesson-11','Real-Time vs Revised Data: What the Fed Is Actually Looking At',11,'reading',40,NULL::jsonb),
  ('lesson-12','Model a Central Bank Reaction Function',12,'canvas_exercise',60,
   '{"ticker":"USDJPY","timeframe":"D1","exercise_prompt":"The Fed''s reaction function can be simplified: if CPI > 3% and unemployment < 4%, hike. If CPI < 2% and unemployment > 5%, cut. Otherwise, hold. A 24-month history of US CPI and unemployment data is shown. For each month, classify the Fed''s implied action using your reaction function. Then plot the actual Fed Funds rate change that month. How accurately does your simplified model predict Fed behaviour? Mark the three biggest mismatches.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Apply reaction function to each month","completed":false},{"id":"2","label":"Compare to actual Fed decisions","completed":false},{"id":"3","label":"Identify three biggest prediction errors","completed":false}]}'::jsonb),
  ('lesson-13','The Fed Put: When and Why the Central Bank Blinks',13,'reading',40,NULL::jsonb),
  ('lesson-14','Emergency Policy Responses: 2008, 2020, and the Patterns',14,'reading',40,NULL::jsonb),
  ('lesson-15','Central Bank Communication Final Assessment',15,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"H1","exercise_prompt":"Five central bank statements from the last two years are displayed as text excerpts. For each statement, draw a small arrow on the EUR/USD hourly chart at the time it was released: up arrow if net hawkish, down arrow if net dovish, horizontal if neutral. Then circle the statement that caused the largest 24-hour price move. What language in that statement triggered the market reaction?","reference_line":{"x1":20,"y1":50,"x2":80,"y2":50},"steps":[{"id":"1","label":"Classify each statement as hawkish/dovish/neutral","completed":false},{"id":"2","label":"Draw directional arrows at each release","completed":false},{"id":"3","label":"Identify the highest-impact statement","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='central-bank-playbooks' ON CONFLICT (course_id,slug) DO NOTHING;

-- currency-wars-rates: seeded 6, target 14 → add 7–14
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Safe Haven Flows in a Crisis: CHF, JPY, and USD',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'The Dollar Smile: USD Strengthens in Both Boom and Bust',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Emerging Market Currency Risk: The Turkey and Argentina Templates',9,'video',40,NULL::jsonb),
  ('lesson-10','Covered Interest Parity and Why It Breaks Under Stress',10,'reading',40,NULL::jsonb),
  ('lesson-11','Trade the Dollar Smile in Practice',11,'canvas_exercise',60,
   '{"ticker":"USDJPY","timeframe":"W1","exercise_prompt":"The dollar smile theory says USD strengthens at both extremes: strong US growth OR global risk-off. On the weekly USD index chart, identify: (1) two periods of USD strength driven by strong US outperformance (mark with a green rectangle and label ''growth''), (2) two periods of USD strength driven by risk-off flight (mark with orange rectangle and label ''risk-off''). For each period, identify which USD pair gave the cleanest expression of each theme and explain why.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Identify growth-driven USD strength periods","completed":false},{"id":"2","label":"Identify risk-off USD strength periods","completed":false},{"id":"3","label":"Select best expressing pair for each theme","completed":false}]}'::jsonb),
  ('lesson-12','SWIFT, Sanctions, and the Dollar''s Reserve Currency Role',12,'reading',40,NULL::jsonb),
  ('lesson-13','De-Dollarisation: Separating Risk from Reality',13,'reading',40,NULL::jsonb),
  ('lesson-14','Currency Crisis Playbook: Signs, Stages, and Positions',14,'canvas_exercise',60,
   '{"ticker":"USDTRY","timeframe":"W1","exercise_prompt":"The Turkish Lira crisis of 2021-2022 is shown on the USD/TRY weekly chart. Mark the following stages on the chart: (1) the initial pressure phase (FX reserves falling, inflation rising), (2) the rate cut error (central bank cuts despite high inflation), (3) the accelerating depreciation, (4) the eventual intervention. For each stage, draw a rectangle and write the one key indicator that would have warned you it was occurring. What was the tradeable moment in this crisis?","reference_line":{"x1":0,"y1":20,"x2":100,"y2":80},"steps":[{"id":"1","label":"Mark all four crisis stages","completed":false},{"id":"2","label":"Label the warning indicator for each stage","completed":false},{"id":"3","label":"Identify the highest-conviction entry point","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='currency-wars-rates' ON CONFLICT (course_id,slug) DO NOTHING;

-- commodity-supercycles: seeded 6, target 13 → add 7–13
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'The Energy Transition and Its Commodity Implications',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Copper as the Global Growth Barometer',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'CFTC Positioning Data: What the Managed Money Report Reveals',9,'video',40,NULL::jsonb),
  ('lesson-10','Seasonal Patterns in Agricultural Commodities',10,'reading',40,NULL::jsonb),
  ('lesson-11','Commodity-Currency Correlations in Detail',11,'reading',40,NULL::jsonb),
  ('lesson-12','Use a Commodity as a Macro Cross-Asset Signal',12,'canvas_exercise',60,
   '{"ticker":"XAUUSD","timeframe":"W1","exercise_prompt":"Copper (orange line) and the AUD/USD (blue line) are displayed on the same weekly chart — both are global growth proxies. They normally track each other. Identify the three periods where they diverged most significantly. For each divergence, draw an arrow showing which instrument you expect to mean-revert to the other, and mark the entry on the lagging instrument. Calculate the approximate R:R if price converged within 8 weeks.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Identify the three divergence periods","completed":false},{"id":"2","label":"Draw mean-reversion arrows","completed":false},{"id":"3","label":"Calculate R:R for each convergence trade","completed":false}]}'::jsonb),
  ('lesson-13','Commodity Supercycle Final Assessment',13,'canvas_exercise',60,
   '{"ticker":"XAUUSD","timeframe":"M1","exercise_prompt":"Five commodity charts are shown side by side: oil, gold, copper, corn, and the Bloomberg Commodity Index. Your task: classify the current macro environment as (A) early cycle, (B) mid cycle, (C) late cycle, or (D) recession/contraction. For each commodity, draw a directional arrow showing your expected bias given your cycle classification. Write two sentences explaining your classification and the single trade you would express it with.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Classify the current macro cycle","completed":false},{"id":"2","label":"Draw directional arrows for each commodity","completed":false},{"id":"3","label":"Write thesis and identify top trade","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='commodity-supercycles' ON CONFLICT (course_id,slug) DO NOTHING;

-- geopolitical-risk-trading: seeded 6, target 12 → add 7–12
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'The VIX as a Geopolitical Risk Barometer',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Event-Driven Gaps: How to Trade Them Without Chasing',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Tail Risk Insurance: Options Structures for Political Events',9,'video',40,NULL::jsonb),
  ('lesson-10','Post-Event Drift: Why Markets Overshoot and Then Correct',10,'reading',40,NULL::jsonb),
  ('lesson-11','Position Around a Surprise Election Result',11,'canvas_exercise',60,
   '{"ticker":"GBPUSD","timeframe":"H1","exercise_prompt":"The 2016 Brexit vote result is shown on GBP/USD hourly chart — the gap down at the open, the initial spike low, and the subsequent 48-hour recovery and then continuation lower. Mark: (1) where a pre-positioned short (placed before results) would have entered and what stop was reasonable, (2) where a trader who missed the initial move could have entered on the dead-cat bounce fade, (3) where momentum continuation traders would have added. Calculate R:R for each entry type.","reference_line":{"x1":10,"y1":30,"x2":100,"y2":60},"steps":[{"id":"1","label":"Mark pre-positioned entry","completed":false},{"id":"2","label":"Mark dead-cat bounce fade entry","completed":false},{"id":"3","label":"Mark momentum continuation entry","completed":false}]}'::jsonb),
  ('lesson-12','Geopolitical Risk Framework: Building It Into Your Process',12,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"W1","exercise_prompt":"Using the framework builder, create your personal geopolitical risk protocol: (1) draw a heat map showing five current geopolitical risks on a 2x2 grid (probability vs severity), (2) for the highest-severity risk, draw what the EUR/USD chart would look like in a materialisation scenario — direction, speed, and likely recovery pattern, (3) mark the maximum position size you would hold going into that event (as a % of normal size). This is your standing risk policy for events.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Draw risk heat map","completed":false},{"id":"2","label":"Model worst-case scenario on chart","completed":false},{"id":"3","label":"Set pre-event position size rule","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='geopolitical-risk-trading' ON CONFLICT (course_id,slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════════
-- LEVEL 8: THE VOLATILITY TRADER
-- ══════════════════════════════════════════════════════════════════════════════

-- options-strategies-advanced: seeded 6, target 20 → add 7–20
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Calendar Spreads: Trading Time Value Across Expiries',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Diagonal Spreads: Combining Directional Bias and Time Decay',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'The Covered Call and Cash-Secured Put: Income Strategies',9,'video',40,NULL::jsonb),
  ('lesson-10','Ratio Spreads: Asymmetric Risk for High-Conviction Views',10,'reading',40,NULL::jsonb),
  ('lesson-11','Broken Wing Butterflies: Building in a Directional Lean',11,'reading',40,NULL::jsonb),
  ('lesson-12','Expiry Selection: Matching Time Frame to Your Thesis',12,'reading',40,NULL::jsonb),
  ('lesson-13','Strike Selection: Delta, Probability, and Risk-Reward Trade-offs',13,'video',40,NULL::jsonb),
  ('lesson-14','Build a Calendar Spread Around an Earnings Event',14,'canvas_exercise',60,
   '{"ticker":"AAPL","timeframe":"D1","exercise_prompt":"Apple earnings are in 7 days. You expect IV to crush post-earnings but are uncertain about direction. Build a calendar spread: sell the front-week ATM straddle, buy the next-month ATM straddle. On the payoff diagram, draw: (1) your max profit zone (price stays near current level), (2) your loss zones (large directional move), (3) the vol crush effect as a downward shift in the short strike''s IV post-earnings. Calculate net debit and max profit.","reference_line":{"x1":35,"y1":20,"x2":65,"y2":20},"steps":[{"id":"1","label":"Structure the calendar spread legs","completed":false},{"id":"2","label":"Draw payoff zones","completed":false},{"id":"3","label":"Model vol crush effect","completed":false}]}'::jsonb),
  ('lesson-15','Rolling Positions: Managing Options That Go Against You',15,'reading',40,NULL::jsonb),
  ('lesson-16','Early Exercise Risk in American-Style Options',16,'reading',40,NULL::jsonb),
  ('lesson-17','Dividend Risk and Options Pricing Around Ex-Div Dates',17,'reading',40,NULL::jsonb),
  ('lesson-18','Options Strategy Selection Framework: A Decision Tree',18,'reading',40,NULL::jsonb),
  ('lesson-19','Managing a Multi-Leg Position Through to Expiry',19,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"You hold an iron condor on SPX with 14 days to expiry. Price has moved to test your short call strike. Three adjustment options are shown: (A) roll the tested side up and out, (B) add a long call to cap further losses, (C) close the entire position for a loss. For each option, draw the new payoff diagram and calculate the new max loss, max profit, and break-even points. Which adjustment is most appropriate given that IV has expanded 30% since entry?","reference_line":{"x1":40,"y1":50,"x2":60,"y2":50},"steps":[{"id":"1","label":"Assess current position risk","completed":false},{"id":"2","label":"Draw adjusted payoffs for all three options","completed":false},{"id":"3","label":"Select adjustment given IV expansion","completed":false}]}'::jsonb),
  ('lesson-20','Options Strategy Exam: Build the Right Structure for 5 Scenarios',20,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"Five market scenarios are presented: (1) strong directional view, low IV, (2) no directional view, IV at 12-month high, (3) expecting large move but unsure of direction, (4) owning stock, want income, (5) owning stock, want downside protection. For each scenario, select the optimal strategy from the list provided and draw its payoff diagram. Justify each choice in one sentence. This is the options course final exam.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Match strategy to each scenario","completed":false},{"id":"2","label":"Draw all five payoff diagrams","completed":false},{"id":"3","label":"Write one-sentence justification for each","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='options-strategies-advanced' ON CONFLICT (course_id,slug) DO NOTHING;

-- implied-vs-realised-vol: seeded 6, target 16 → add 7–16
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'The Volatility Risk Premium: The Statistical Edge in Selling Vol',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Term Structure of IV: Near-Term vs Long-Dated Volatility',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Event Volatility: Earnings, FOMC, and Scheduled Risk',9,'video',40,NULL::jsonb),
  ('lesson-10','Post-Event Vol Crush: The Pattern That Options Sellers Rely On',10,'reading',40,NULL::jsonb),
  ('lesson-11','IV Percentile vs IV Rank: The Operational Difference',11,'reading',40,NULL::jsonb),
  ('lesson-12','Position Around a Vol Crush Setup',12,'canvas_exercise',60,
   '{"ticker":"AAPL","timeframe":"D1","exercise_prompt":"Apple reports earnings in 4 days. Current IV Rank is 88 (near 1-year highs). Historical average post-earnings move is +/-3.5%; the options market is pricing +/-5.2%. Draw: (1) a horizontal line at the expected move boundary (+/-5.2% from current price), (2) your short strangle strikes just outside the expected move, (3) the vol crush target (IV returns to pre-earnings level). Calculate your net premium received and maximum loss.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Mark expected move boundaries","completed":false},{"id":"2","label":"Draw short strangle strikes","completed":false},{"id":"3","label":"Calculate net premium and max loss","completed":false}]}'::jsonb),
  ('lesson-13','The Roll Return in Volatility: Why VIX ETPs Decay',13,'reading',40,NULL::jsonb),
  ('lesson-14','Vol Surface Changes as Real-Time Market Intelligence',14,'reading',40,NULL::jsonb),
  ('lesson-15','Sector Volatility Relative to Market Volatility',15,'video',40,NULL::jsonb),
  ('lesson-16','Build a Systematic Volatility Selling Screen',16,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"A universe of 20 stocks is shown with their IV Rank, IV Percentile, and historical vs implied volatility premium. Your screening criteria: IV Rank > 50, IV premium (IV minus 30-day realised) > 5 vol points, no earnings within 14 days. Draw circles around the stocks that pass all three filters. For the top candidate, draw the iron condor structure on its payoff diagram. Calculate expected annual return if you collected this premium monthly with 80% success rate.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Apply all three screening filters","completed":false},{"id":"2","label":"Identify top candidate","completed":false},{"id":"3","label":"Calculate annualised expected return","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='implied-vs-realised-vol' ON CONFLICT (course_id,slug) DO NOTHING;

-- volatility-surface: seeded 6, target 14 → add 7–14
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Sticky Strike vs Sticky Delta: How the Surface Moves',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'The Volatility Cone: Putting Current IV in Historical Context',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Risk Reversals: The Market''s Directional Lean in One Number',9,'video',40,NULL::jsonb),
  ('lesson-10','Vol of Vol: When Implied Volatility Itself Becomes Unstable',10,'reading',40,NULL::jsonb),
  ('lesson-11','Surface Changes Around Major Market Events',11,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"Two vol surface snapshots are shown: one from a calm period (VIX = 14) and one from a stress period (VIX = 32). On each surface diagram, draw: (1) a circle at the steepest skew point, (2) an arrow showing the direction of term structure slope. Then draw a single line chart below showing how the 25-delta put skew changed between the two periods. What does steepening skew tell you about the hedging behaviour of large institutions?","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Mark steepest skew on both surfaces","completed":false},{"id":"2","label":"Mark term structure slope direction","completed":false},{"id":"3","label":"Interpret steepening skew","completed":false}]}'::jsonb),
  ('lesson-12','Trading Volatility Surface Anomalies for Edge',12,'reading',40,NULL::jsonb),
  ('lesson-13','Correlation Skew Across Asset Classes',13,'reading',40,NULL::jsonb),
  ('lesson-14','Volatility Surface Final Analysis',14,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"The current vol surface for SPX is displayed. Three anomalies are flagged: (A) the 1-week vs 1-month IV ratio is at a 2-year high (near-term fear spike), (B) the 25-delta call skew is unusually expensive relative to put skew (unusual upside demand), (C) the 3-month ATM IV is below the 1-year ATM IV (inverted term structure). For each anomaly, draw the options trade that exploits it and calculate the expected P&L if the anomaly reverts to its 1-year average within 30 days.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Identify all three anomalies on the surface","completed":false},{"id":"2","label":"Design a trade for each anomaly","completed":false},{"id":"3","label":"Calculate expected P&L on reversion","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='volatility-surface' ON CONFLICT (course_id,slug) DO NOTHING;

-- delta-gamma-hedging: seeded 6, target 15 → add 7–15
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Theta: The Daily Cost of Holding an Option',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Rho: Interest Rate Risk in Your Options Book',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Vanna and Charm: Second-Order Greeks That Move Markets',9,'video',40,NULL::jsonb),
  ('lesson-10','Gamma-Weighted Position Sizing',10,'reading',40,NULL::jsonb),
  ('lesson-11','Gamma Scalping Simulation',11,'canvas_exercise',60,
   '{"ticker":"AAPL","timeframe":"H1","exercise_prompt":"You are long a straddle on Apple (long gamma). Price moves +5% over 4 hours in a series of hourly moves. At each bar, the options panel shows your updated delta. Draw vertical lines at the points where you would rebalance (delta exceeds ±0.20). At each rebalance: draw an arrow showing whether you buy or sell Apple stock to return to delta-neutral. Calculate total gamma scalping P&L if you collected 0.50 per delta unit rebalanced.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":25},"steps":[{"id":"1","label":"Track delta at each hourly bar","completed":false},{"id":"2","label":"Mark rebalance trigger points","completed":false},{"id":"3","label":"Calculate gamma scalping P&L","completed":false}]}'::jsonb),
  ('lesson-12','Practical Delta Hedging Frequency Decisions',12,'reading',40,NULL::jsonb),
  ('lesson-13','Aggregate Portfolio Greeks: Managing the Whole Book',13,'reading',40,NULL::jsonb),
  ('lesson-14','Stress Testing a Greeks Book Against Rapid Market Moves',14,'reading',40,NULL::jsonb),
  ('lesson-15','Greeks Management Final Assessment',15,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"You manage a multi-leg options book shown in the position summary. Total portfolio delta is +0.45, gamma is +12, theta is -250/day, vega is +8,000. SPX drops 2% over the next session. Recalculate each Greek after the move using the approximation formulas shown. Draw a bar chart showing: original Greeks vs post-move Greeks. Which Greek changed most relative to your risk tolerance? What single trade would you place to rebalance your book back within limits?","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Recalculate all Greeks after the move","completed":false},{"id":"2","label":"Draw original vs post-move Greek bars","completed":false},{"id":"3","label":"Design the rebalancing trade","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='delta-gamma-hedging' ON CONFLICT (course_id,slug) DO NOTHING;

-- options-portfolio-protection: seeded 6, target 13 → add 7–13
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'The True Drag of Chronic Hedging: A Long-Term Cost Study',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Dynamic vs Static Hedging: When Each Approach Is Right',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Cross-Asset Hedges: Gold, Rates, and VIX as Portfolio Insurance',9,'video',40,NULL::jsonb),
  ('lesson-10','Correlation Failure: When Your Hedge Stops Working',10,'reading',40,NULL::jsonb),
  ('lesson-11','Design a Dynamic Hedging Programme for a Real Portfolio',11,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"W1","exercise_prompt":"You manage a £500,000 equity portfolio correlated to the S&P 500. Your maximum acceptable drawdown is 15%. Design a dynamic hedging programme: (1) draw the unhedged portfolio payoff vs market, (2) draw a rolling put hedge programme (buy 3-month 10% OTM puts, roll monthly) and its cost drag, (3) draw a conditional hedge (only buy puts when VIX < 15, cheaper insurance). Calculate annual cost of each approach and net return impact. Which programme best balances protection cost vs benefit?","reference_line":{"x1":0,"y1":30,"x2":100,"y2":70},"steps":[{"id":"1","label":"Draw unhedged portfolio payoff","completed":false},{"id":"2","label":"Draw rolling put hedge with cost drag","completed":false},{"id":"3","label":"Compare conditional vs rolling hedge cost","completed":false}]}'::jsonb),
  ('lesson-12','Hedging a Concentrated Single-Stock Position',12,'reading',40,NULL::jsonb),
  ('lesson-13','Portfolio Protection Final Assessment',13,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"Three market stress scenarios are shown: (A) gradual -20% over 3 months (2022-style), (B) sudden -30% crash in 2 weeks (March 2020-style), (C) -10% followed by immediate recovery. Apply your hedging programme to each scenario. Draw the hedged portfolio equity curve vs unhedged for each. For which scenario does hedging add the most value? For which does it destroy the most? Write your hedging policy in two sentences.","reference_line":{"x1":0,"y1":40,"x2":100,"y2":60},"steps":[{"id":"1","label":"Apply hedge to all three scenarios","completed":false},{"id":"2","label":"Draw hedged vs unhedged curves","completed":false},{"id":"3","label":"Write two-sentence hedging policy","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='options-portfolio-protection' ON CONFLICT (course_id,slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════════
-- LEVEL 9: THE BOOK RUNNER
-- ══════════════════════════════════════════════════════════════════════════════

-- multi-strategy-portfolio: seeded 6, target 18 → add 7–18
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Sharpe Maximisation vs Drawdown Minimisation: Different Goals',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Strategy Weighting: Risk Parity, Minimum Variance, Maximum Sharpe',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Dynamic Rebalancing: When to Shift Capital Between Strategies',9,'video',40,NULL::jsonb),
  ('lesson-10','Regime-Conditional Strategy Allocation',10,'reading',40,NULL::jsonb),
  ('lesson-11','Simulate a Multi-Strategy Portfolio Rebalance',11,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"Three strategy equity curves are shown for the past year: Trend (blue), Mean Reversion (orange), Macro Carry (green). Their monthly correlation matrix is displayed. Monthly, you reallocate capital based on the prior 3-month Sharpe of each strategy. Draw the dynamic allocation bars for each month (three bars per month summing to 100%). Then draw the blended portfolio equity curve. Compare its Sharpe and max drawdown to the equal-weighted blend.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Calculate 3-month rolling Sharpe for each strategy","completed":false},{"id":"2","label":"Draw monthly allocation bars","completed":false},{"id":"3","label":"Compare dynamic vs equal-weight blend","completed":false}]}'::jsonb),
  ('lesson-12','Leverage in a Multi-Strategy Portfolio: Opportunity and Risk',12,'reading',40,NULL::jsonb),
  ('lesson-13','Portfolio-Level vs Strategy-Level Drawdown Limits',13,'reading',40,NULL::jsonb),
  ('lesson-14','New Strategy Onboarding: The Mandatory 90-Day Trial',14,'reading',40,NULL::jsonb),
  ('lesson-15','Strategy Sunset: When and How to Turn Off a Non-Performing Strategy',15,'video',40,NULL::jsonb),
  ('lesson-16','Capacity Constraints: How Much Capital Can Each Strategy Handle?',16,'reading',40,NULL::jsonb),
  ('lesson-17','Institutional Benchmark Comparison: Are You Beating the Risk-Free Rate?',17,'reading',40,NULL::jsonb),
  ('lesson-18','Multi-Strategy Portfolio Final Assessment',18,'canvas_exercise',60,
   '{"ticker":"EURUSD","timeframe":"D1","exercise_prompt":"Your four-strategy book is shown with 2-year performance data. The portfolio has just entered a 12% drawdown driven primarily by Strategy 2 (mean reversion) performing poorly in a trending market. Draw: (1) the contribution of each strategy to the current drawdown as a waterfall chart, (2) the proposed reallocation (reduce Strategy 2, increase Strategy 1 trend-following), (3) the projected recovery path under the new weights assuming each strategy reverts to its historical Sharpe. Justify the reallocation decision.","reference_line":{"x1":0,"y1":40,"x2":100,"y2":60},"steps":[{"id":"1","label":"Draw drawdown attribution waterfall","completed":false},{"id":"2","label":"Draw proposed reallocation","completed":false},{"id":"3","label":"Project recovery under new weights","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='multi-strategy-portfolio' ON CONFLICT (course_id,slug) DO NOTHING;

-- factor-investing: seeded 6, target 16 → add 7–16
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Factor Timing: Does It Work, and Should You Even Try?',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Smart Beta ETFs: Factor Investing Without Stock Picking',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Factor Decay: How Academic Premia Get Arbitraged Away',9,'video',40,NULL::jsonb),
  ('lesson-10','Multi-Factor Models: Combining Value, Momentum, and Quality',10,'reading',40,NULL::jsonb),
  ('lesson-11','Transaction Costs in Factor Strategies: The Hidden Drag',11,'reading',40,NULL::jsonb),
  ('lesson-12','Analyse Your Portfolio''s Hidden Factor Exposures',12,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"Your current portfolio of 10 positions is displayed with each stock''s factor scores: Value (P/B rank), Momentum (6-month return rank), Quality (ROE rank), and Beta. Draw a radar chart for your portfolio showing average exposure to each factor vs the market benchmark. If your portfolio has unintended high beta and low quality exposure, draw the two trades you would make to bring it closer to your target factor profile (reduce beta, improve quality).","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Draw portfolio factor radar chart","completed":false},{"id":"2","label":"Compare to target factor profile","completed":false},{"id":"3","label":"Design rebalancing trades","completed":false}]}'::jsonb),
  ('lesson-13','ESG as a Factor: The Empirical Evidence',13,'reading',40,NULL::jsonb),
  ('lesson-14','International Factor Premia: Do Factors Work Globally?',14,'video',40,NULL::jsonb),
  ('lesson-15','Factor Crowding: When Everyone Owns the Same Trade',15,'reading',40,NULL::jsonb),
  ('lesson-16','Factor Portfolio Construction Final Assessment',16,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"M1","exercise_prompt":"Build a factor-tilted portfolio from scratch using the 30-stock universe provided. Score each stock across four factors (value, momentum, quality, low vol) and rank them. Select the 10 highest composite scorers. Draw a bar chart comparing your factor-tilted portfolio''s expected characteristics (Sharpe, max drawdown, beta) to a simple equal-weight S&P 500 ETF. Does the factor tilt justify the additional complexity and turnover cost?","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Score and rank all 30 stocks","completed":false},{"id":"2","label":"Select top 10 composite scorers","completed":false},{"id":"3","label":"Compare expected characteristics to benchmark","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='factor-investing' ON CONFLICT (course_id,slug) DO NOTHING;

-- portfolio-attribution: seeded 6, target 14 → add 7–14
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Risk Attribution: Where Are Your Largest Risk Contributions?',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Drawdown Attribution: Which Positions Drove Your Worst Period?',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Attribution Over Multiple Time Periods: Consistency vs Fluke',9,'video',40,NULL::jsonb),
  ('lesson-10','Style Drift Attribution: Have You Become a Different Trader?',10,'reading',40,NULL::jsonb),
  ('lesson-11','Sector Attribution Deep Dive',11,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"Your portfolio returned +14% vs the S&P 500''s +10% over 6 months. The 4% alpha needs to be attributed. A sector breakdown is shown for both your portfolio and the benchmark. Draw a bar chart with three bars per sector: (1) your sector weight, (2) benchmark weight, (3) your stock selection return vs benchmark within that sector. Separate the alpha into: allocation effect (being overweight strong sectors) vs selection effect (picking better stocks within sectors). Which effect drove more of your outperformance?","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Draw sector weight comparison bars","completed":false},{"id":"2","label":"Calculate allocation vs selection effect","completed":false},{"id":"3","label":"Identify primary alpha source","completed":false}]}'::jsonb),
  ('lesson-12','Timing Attribution: Measuring the Value of Your Entry and Exit Timing',12,'reading',40,NULL::jsonb),
  ('lesson-13','Using Attribution to Scale What Works and Cut What Doesn''t',13,'reading',40,NULL::jsonb),
  ('lesson-14','Portfolio Attribution Final Assessment',14,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"Two traders both returned +20% last year. Trader A''s attribution shows 18% from one exceptional trade and 2% from everything else. Trader B''s attribution shows +4% from each of 5 independent decisions. Draw the attribution waterfall for each trader. Whose performance is more repeatable? Calculate what each trader''s expected return would be if you removed their single best year. Write two sentences explaining why attribution quality matters more than the return number alone.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Draw attribution waterfall for each trader","completed":false},{"id":"2","label":"Calculate performance without best year","completed":false},{"id":"3","label":"Assess repeatability","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='portfolio-attribution' ON CONFLICT (course_id,slug) DO NOTHING;

-- stress-testing-scenarios: seeded 6, target 13 → add 7–13
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Reverse Stress Testing: What Would Actually Blow Up Your Book?',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Liquidity Stress: When Volume Disappears and You Cannot Exit',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Building Custom Stress Scenarios from First Principles',9,'video',40,NULL::jsonb),
  ('lesson-10','Counterparty Risk: Stress Testing Broker and Bank Exposure',10,'reading',40,NULL::jsonb),
  ('lesson-11','Run a Custom Stress Test on Your Current Book',11,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"W1","exercise_prompt":"Design and run a custom stress scenario: ''Stagflation — equity markets -25%, rates +200bps, USD +15%, gold +20%, oil +40%.'' Apply this to your current multi-asset portfolio. For each position, draw the expected P&L impact as a bar (up = profit, down = loss). Sum the bars to get total portfolio impact. Draw the resulting equity curve. Does this scenario breach your max drawdown limit? What single hedge would most cost-effectively protect against it?","reference_line":{"x1":0,"y1":40,"x2":100,"y2":60},"steps":[{"id":"1","label":"Apply stagflation scenario to each position","completed":false},{"id":"2","label":"Draw P&L bars and total impact","completed":false},{"id":"3","label":"Identify most cost-effective hedge","completed":false}]}'::jsonb),
  ('lesson-12','Pre-Planning Crisis Responses: Decision Trees for Stress Events',12,'reading',40,NULL::jsonb),
  ('lesson-13','Stress Testing Final Assessment',13,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"W1","exercise_prompt":"Three stress tests are shown with results for your book: (A) 2008 financial crisis replica, (B) 2020 COVID crash, (C) your custom stagflation scenario. For each test, draw a horizontal bar showing: portfolio loss %, recovery time at historical Sharpe, and whether you breach your max drawdown limit. For the worst scenario, write your pre-planned response: which positions you close first, which you hold, and at what exact loss level you implement each step.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Draw results for all three stress tests","completed":false},{"id":"2","label":"Identify worst-case scenario","completed":false},{"id":"3","label":"Write pre-planned crisis response","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='stress-testing-scenarios' ON CONFLICT (course_id,slug) DO NOTHING;

-- performance-reporting: seeded 6, target 12 → add 7–12
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'CAGR, TWRR, and MWRR: When Each Return Metric Matters',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Including Attribution in Your Monthly Report',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Presenting Drawdowns Honestly to External Audiences',9,'video',40,NULL::jsonb),
  ('lesson-10','Benchmarking: Choosing the Right Comparator for Your Strategy',10,'reading',40,NULL::jsonb),
  ('lesson-11','Build a Complete Annual Performance Report',11,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"Build a full annual report on the canvas: (1) draw your 12-month equity curve, marking peak and max drawdown trough, (2) draw a monthly returns heatmap (12 cells, green positive, red negative), (3) calculate: CAGR, Sharpe, Sortino, max drawdown, and win rate, (4) draw a benchmark comparison bar showing your return vs S&P 500 for the year, (5) write a 3-sentence year-end summary covering your edge, what went wrong, and what you will change. This is your auditable annual record.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Draw equity curve and monthly heatmap","completed":false},{"id":"2","label":"Calculate all five performance metrics","completed":false},{"id":"3","label":"Write three-sentence year-end summary","completed":false}]}'::jsonb),
  ('lesson-12','Audit Trail: Why Trade Log Integrity Is Non-Negotiable',12,'reading',40,NULL::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='performance-reporting' ON CONFLICT (course_id,slug) DO NOTHING;


-- ══════════════════════════════════════════════════════════════════════════════
-- LEVEL 10: THE GENERAL PARTNER
-- ══════════════════════════════════════════════════════════════════════════════

-- hedge-fund-structure: seeded 6, target 14 → add 7–14
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Master-Feeder Structures and Series LLC Funds',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Offshore Structures: Cayman, BVI, and Luxembourg',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'The ISDA Master Agreement: Your Legal Foundation for Derivatives',9,'video',40,NULL::jsonb),
  ('lesson-10','Fund Legal Documentation: PPM, LPA, and Subscription Agreement',10,'reading',40,NULL::jsonb),
  ('lesson-11','Negotiate Fund Terms from an Investor Perspective',11,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"You are an investor reviewing a new fund''s terms. The term sheet shows: 2% management fee, 20% performance fee, quarterly redemptions with 90-day notice, 2-year lockup, and no hurdle rate. On the negotiation canvas, mark each term as (A) acceptable market standard, (B) aggressive — push back, or (C) deal-breaker. Draw a revised term sheet showing your counter-proposal. Calculate the LP return impact of the original vs your revised terms on a 15% gross return year.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Classify each term","completed":false},{"id":"2","label":"Draft counter-proposal term sheet","completed":false},{"id":"3","label":"Calculate LP return impact of both versions","completed":false}]}'::jsonb),
  ('lesson-12','Managed Account Structures vs Fund Vehicles',12,'reading',40,NULL::jsonb),
  ('lesson-13','Family Office and Separate Account Mandates',13,'reading',40,NULL::jsonb),
  ('lesson-14','Fund Structure Final Assessment',14,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"You are launching a fund targeting UK and US institutional investors. Three structure options are presented: (A) Cayman Islands fund with UK FCA registration, (B) UK ICAV with US 3(c)(1) exemption, (C) UK Limited Partnership with AIFMD registration. Draw a decision matrix scoring each option across five criteria: investor reach, regulatory cost, tax efficiency, setup time, and ongoing compliance burden. Score each 1-5. Which structure wins for your investor base and strategy type?","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Score all three structures across five criteria","completed":false},{"id":"2","label":"Draw decision matrix","completed":false},{"id":"3","label":"Select and justify optimal structure","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='hedge-fund-structure' ON CONFLICT (course_id,slug) DO NOTHING;

-- capital-raising: seeded 6, target 15 → add 7–15
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Building a Track Record from Day One: What to Document',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'The Manager Pitch Deck: What Works and What Gets You Dismissed',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'The Investment Thesis One-Pager: Your 90-Second Sell',9,'video',40,NULL::jsonb),
  ('lesson-10','Seed Capital vs Strategic Capital: The Difference and Why It Matters',10,'reading',40,NULL::jsonb),
  ('lesson-11','Passing Operational Due Diligence: What Allocators Check',11,'reading',40,NULL::jsonb),
  ('lesson-12','Investor Relations in a Drawdown: What to Say and How to Say It',12,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"Your fund is in a 15% drawdown. You need to write a monthly investor letter. On the canvas: (1) draw your equity curve showing the drawdown clearly — do not hide it, (2) write a three-paragraph letter: paragraph 1 describes what happened, paragraph 2 explains why the drawdown is within your strategy''s historical norm and what you are doing differently (if anything), paragraph 3 states your forward outlook. The system will grade your letter on honesty, clarity, and professionalism.","reference_line":{"x1":0,"y1":60,"x2":100,"y2":45},"steps":[{"id":"1","label":"Draw equity curve showing drawdown honestly","completed":false},{"id":"2","label":"Write three-paragraph investor letter","completed":false},{"id":"3","label":"Review for honesty and professionalism","completed":false}]}'::jsonb),
  ('lesson-13','AUM Milestones and Their Operational Implications',13,'reading',40,NULL::jsonb),
  ('lesson-14','The Second Close: How Funds Keep Raising After Launch',14,'reading',40,NULL::jsonb),
  ('lesson-15','Capital Raising Final Assessment',15,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"Build your complete capital raising plan on the canvas. Draw a timeline from now to your first institutional close: (1) mark Month 1-3: building the track record and DDQ, (2) mark Month 4-6: first seeder meetings and one-pager refinement, (3) mark Month 7-12: roadshow and first close target, (4) mark Year 2: second close and first external hire. For each milestone, list the single biggest risk that could prevent you reaching it. This is your fundraising roadmap.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Draw the fundraising timeline","completed":false},{"id":"2","label":"Mark milestones and first close target","completed":false},{"id":"3","label":"List biggest risk at each stage","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='capital-raising' ON CONFLICT (course_id,slug) DO NOTHING;

-- regulatory-compliance: seeded 6, target 13 → add 7–13
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'GDPR and Data Protection Obligations for Investment Firms',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Market Manipulation Rules: What They Are and What Trips Them',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Whistleblowing Frameworks and Their Legal Protections',9,'video',40,NULL::jsonb),
  ('lesson-10','Building a Compliance Calendar: What to File and When',10,'reading',40,NULL::jsonb),
  ('lesson-11','Documenting Your Compliance Decisions: The Paper Trail',11,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"Five compliance scenarios are presented on a timeline: (1) a portfolio manager trades a personal account 2 days before a client order in the same instrument, (2) a research note is shared with a client without proper MiFID II attribution, (3) your best execution policy has not been reviewed in 18 months, (4) a new investor''s AML check was not completed before accepting their capital, (5) your fund AUM crossed the FCA registration threshold 3 months ago without notification. Mark each violation''s severity (minor/major/critical) and write the remediation step for each.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Identify and classify all five violations","completed":false},{"id":"2","label":"Rate severity for each","completed":false},{"id":"3","label":"Write remediation step per violation","completed":false}]}'::jsonb),
  ('lesson-12','Regulatory Capital Requirements for Trading Firms',12,'reading',40,NULL::jsonb),
  ('lesson-13','Compliance Final Assessment',13,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"Design your fund''s compliance infrastructure on the org chart canvas. You have a £50M fund with 3 employees. Draw the compliance function structure: (1) who is your MLRO (Money Laundering Reporting Officer), (2) what your annual compliance review calendar looks like (12 monthly tasks), (3) your best execution policy review cycle, (4) your personal account dealing policy. Identify the two compliance gaps that most commonly cause FCA enforcement action in funds of your size.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Draw compliance org structure","completed":false},{"id":"2","label":"Build annual compliance calendar","completed":false},{"id":"3","label":"Identify two highest-risk compliance gaps","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='regulatory-compliance' ON CONFLICT (course_id,slug) DO NOTHING;

-- fund-operations: seeded 6, target 12 → add 7–12
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Daily Reconciliation: Trade Matching and P&L Explanation',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'NAV Calculation: How Fund Administrators Value Your Book',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'Technology Stack for a Lean Fund: OMS, PMS, and Risk System',9,'video',40,NULL::jsonb),
  ('lesson-10','Disaster Recovery and Business Continuity Planning',10,'reading',40,NULL::jsonb),
  ('lesson-11','Operational Stress Test: What Breaks in a Market Crisis',11,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"A market crisis scenario: your prime broker suspends withdrawals, your OMS connectivity is down, and three of your positions have incorrect market prices in your PMS. Draw your operational response flowchart: (1) who you call first and in what order, (2) how you calculate NAV manually without your systems, (3) your investor communication within 24 hours. Identify the single operational dependency that would cause the most damage if it failed, and describe your mitigation.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Draw crisis response flowchart","completed":false},{"id":"2","label":"Describe manual NAV calculation process","completed":false},{"id":"3","label":"Identify critical single point of failure","completed":false}]}'::jsonb),
  ('lesson-12','Fund Operations Final Assessment',12,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"D1","exercise_prompt":"Complete the fund operations blueprint on the canvas. For a £25M long/short equity fund: (1) draw the full counterparty map — prime broker, fund administrator, auditor, legal counsel, technology providers, (2) draw the daily operational workflow from market open to end-of-day reconciliation, (3) mark the three tasks that an investor conducting operational due diligence will check first, and confirm your process for each. This blueprint is the operational core of your fund.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":50},"steps":[{"id":"1","label":"Draw complete counterparty map","completed":false},{"id":"2","label":"Draw daily operational workflow","completed":false},{"id":"3","label":"Confirm ODD readiness for top three checks","completed":false}]}'::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='fund-operations' ON CONFLICT (course_id,slug) DO NOTHING;

-- building-your-legacy: seeded 6, target 12 → add 7–12
INSERT INTO lessons (course_id,slug,title,order_index,type,xp_value,content)
SELECT c.id,l.slug,l.title,l.order_index,l.type,l.xp_value,l.content FROM courses c
CROSS JOIN (VALUES
  ('lesson-7', 'Writing Your Investment Philosophy: The Document That Outlasts You',7,'reading',40,NULL::jsonb),
  ('lesson-8', 'Hiring: The First Three People Who Will Define Your Culture',8,'reading',40,NULL::jsonb),
  ('lesson-9', 'How Renaissance Technologies Stayed Curious for 40 Years',9,'video',40,NULL::jsonb),
  ('lesson-10','The PM Transition: When You Stop Trading and Start Managing Traders',10,'reading',40,NULL::jsonb),
  ('lesson-11','Map Your 5-Year Legacy Plan',11,'canvas_exercise',60,
   '{"ticker":"SPX","timeframe":"W1","exercise_prompt":"Using the legacy builder, plot your 5-year fund roadmap on a timeline: (1) Year 1: initial AUM target and strategy focus, (2) Year 2: first external hire and processes that no longer depend on you alone, (3) Year 3: institutional-ready AUM and audit-quality reporting, (4) Year 4: second strategy added, (5) Year 5: your long-term AUM goal and what you want to be known for. For each milestone, write the single biggest risk and your pre-planned mitigation. Sign the plan.","reference_line":{"x1":0,"y1":50,"x2":100,"y2":30},"steps":[{"id":"1","label":"Plot all five year milestones","completed":false},{"id":"2","label":"Write risk and mitigation for each","completed":false},{"id":"3","label":"Sign the plan","completed":false}]}'::jsonb),
  ('lesson-12','The Final Lesson: What Markets Teach You About Yourself',12,'reading',40,NULL::jsonb)
) AS l(slug,title,order_index,type,xp_value,content)
WHERE c.slug='building-your-legacy' ON CONFLICT (course_id,slug) DO NOTHING;

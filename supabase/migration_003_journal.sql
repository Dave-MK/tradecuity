-- Trade journal entries table
-- Run this in the Supabase SQL editor

CREATE TABLE IF NOT EXISTS journal_entries (
  id            uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id       uuid REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
  created_at    timestamptz DEFAULT now(),
  trade_date    date NOT NULL,
  instrument    text NOT NULL,
  direction     text CHECK (direction IN ('long', 'short')) NOT NULL,
  entry_price   numeric(18, 5),
  exit_price    numeric(18, 5),
  size          numeric(18, 5),
  pnl           numeric(18, 2),
  rating        int  CHECK (rating BETWEEN 1 AND 5),
  notes         text,
  tags          text[] DEFAULT '{}'
);

ALTER TABLE journal_entries ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users manage own journal entries"
  ON journal_entries
  FOR ALL
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

CREATE INDEX IF NOT EXISTS idx_journal_entries_user_date
  ON journal_entries (user_id, trade_date DESC);

-- Waitlist for community feature
CREATE TABLE IF NOT EXISTS waitlist (
  id         uuid DEFAULT gen_random_uuid() PRIMARY KEY,
  email      text NOT NULL UNIQUE,
  created_at timestamptz DEFAULT now()
);

-- Only admins can read; anyone can insert (public waitlist)
ALTER TABLE waitlist ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anyone can join waitlist"
  ON waitlist FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Service role can read waitlist"
  ON waitlist FOR SELECT
  USING (auth.role() = 'service_role');

type TrenduosoWordmarkProps = {
  className?: string;
  ariaLabel?: string;
};

export function TrenduosoWordmark({
  className = "",
  ariaLabel = "Trenduoso",
}: TrenduosoWordmarkProps) {
  return (
    <span
      className={`trenduoso-wordmark ${className}`}
      aria-label={ariaLabel}
      role="img"
    >
      <span className="trenduoso-wordmark__trend" aria-hidden="true">
        trend
      </span>
      <span className="trenduoso-wordmark__uoso" aria-hidden="true">
        uoso
      </span>
    </span>
  );
}

/*
MANDATORY IMPLEMENTATION RULE:
- Keep the wordmark as live HTML text.
- Do not replace this component with a PNG, JPG, WebP or SVG containing outlined text.
- It must remain accessible, responsive, selectable and crisp on every screen density.
*/
;;; ~/.doom.d/bindings.el -*- lexical-binding: t; -*-

(evil-define-key 'normal tide-mode-map "R" 'tide-references)
(evil-define-key 'normal tide-mode-map "." 'tide-fix)
(evil-define-key 'normal tide-mode-map "C-c t r" 'tide-rename-symbol)
(evil-define-key 'normal tide-mode-map "C-o" 'tide-organize-imports)
(evil-define-key 'normal tide-mode-map "Q" 'rjsx-rename-tag-at-point)

(use-package avy
  :bind
    ("C-;" . avy-goto-word-or-subword-1)
    ("C-c j l" . avy-goto-line)
    ("C-c j c" . avy-goto-char)
)

(use-package tide
  :bind
    ("C-c t ." . tide-fix)
    ("C-c t r" . tide-rename-symbol)
    ("C-c t o" . tide-organize-imports)
    ("C-M-l" . prettier-js)
    )

;;;(use-package rust
  ;;;:bind
;;;  ("C-M-l" . rustic-format-buffer)
;;;  )

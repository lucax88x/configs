
(setq-default typescript-indent-level 2)
(setq tide-format-options '(
                            :insertSpaceAfterFunctionKeywordForAnonymousFunctions t 
                            :placeOpenBraceOnNewLineForFunctions nil
                            :indentSize 2 :indentStyle 2 :tabSize 2 :ConvertTabsToSpaces t
                            ))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))

(use-package prettier-js
  :init
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'prettier-js-mode)
  (add-hook 'typescript-mode-hook 'prettier-js-mode)
)


;; Set Projectile root dir
(setq projectile-project-search-path '("~/repos/"))

(after! projectile
  (pushnew! projectile-project-root-files "package.json")
  (pushnew! projectile-globally-ignored-directories "node_modules" "dist" "build"))
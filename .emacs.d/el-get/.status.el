((ample-regexps status "installed" recipe
		(:name ample-regexps :description "Compose and reuse Emacs regular expressions with ease" :type github :pkgname "immerrr/ample-regexps.el"))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:features el-get :post-init
		(when
		    (memq 'el-get
			  (bound-and-true-p package-activated-list))
		  (message "Deleting melpa bootstrap el-get")
		  (unless package--initialized
		    (package-initialize t))
		  (when
		      (package-installed-p 'el-get)
		    (let
			((feats
			  (delete-dups
			   (el-get-package-features
			    (el-get-elpa-package-directory 'el-get)))))
		      (el-get-elpa-delete-package 'el-get)
		      (dolist
			  (feat feats)
			(unload-feature feat t))))
		  (require 'el-get))))
 (lua-mode status "installed" recipe
	   (:name lua-mode :description "A major-mode for editing Lua scripts" :depends
		  (ample-regexps)
		  :type github :pkgname "immerrr/lua-mode"))
 (package status "installed" recipe
	  (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
		 (progn
		   (let
		       ((old-package-user-dir
			 (expand-file-name
			  (convert-standard-filename
			   (concat
			    (file-name-as-directory default-directory)
			    "elpa")))))
		     (when
			 (file-directory-p old-package-user-dir)
		       (add-to-list 'package-directory-list old-package-user-dir)))
		   (setq package-archives
			 (bound-and-true-p package-archives))
		   (mapc
		    (lambda
		      (pa)
		      (add-to-list 'package-archives pa 'append))
		    '(("ELPA" . "http://tromey.com/elpa/")
		      ("melpa" . "http://melpa.org/packages/")
		      ("gnu" . "http://elpa.gnu.org/packages/")
		      ("marmalade" . "http://marmalade-repo.org/packages/")
		      ("SC" . "http://joseito.republika.pl/sunrise-commander/")))))))

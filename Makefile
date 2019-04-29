PACKAGE_NAME = course-task
ORG_FILE = $(PACKAGE_NAME).org
TEST_NAME = test
ARCHIVE_FILES = Makefile course-work-task.sty test.tex

$(TEST_NAME).pdf: $(TEST_NAME).tex $(PACKAGE_NAME).sty $(BUILD_DIR)
	pdflatex $(TEST_NAME).tex

$(PACKAGE_NAME).sty $(TEST_NAME).tex environment.tex commands.tex: $(PACKAGE_NAME).org $(BUILD_DIR)
	emacs --script org-tangle.el "$(ORG_FILE)"

$(PACKAGE_NAME).zip: $(ARCHIVE_FILES)
	zip $(PACKAGE_NAME).zip $(ARCHIVE_FILES)

install-packages:
	sudo apt-get install -y texlive-base texlive-latex-base texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra texlive-lang-cyrillic texlive-bibtex-extra

Makefile: $(ORG_FILE)
	emacs --batch --exec "(progn (find-file \"$(ORG_FILE)\") (org-babel-tangle nil nil makefile))"

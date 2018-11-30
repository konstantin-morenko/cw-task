PACKAGE_NAME = course-work-task
ORG_FILES = course-work-task.org
TEST_NAME = test
ARCHIVE_FILES = Makefile course-work-task.sty test.tex

$(TEST_NAME).pdf: $(TEST_NAME).tex $(PACKAGE_NAME).sty $(BUILD_DIR)
	pdflatex $(TEST_NAME).tex

$(PACKAGE_NAME).sty: $(PACKAGE_NAME).org $(BUILD_DIR)
	emacs --script org-tangle.el "$(ORG_FILES)"

$(PACKAGE_NAME).zip: $(ARCHIVE_FILES)
	zip $(PACKAGE_NAME).zip $(ARCHIVE_FILES)

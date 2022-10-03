setup:
	pip install -r cli/requirements.txt
	cd cli && python setup.py install
	brew install poppler
	pip uninstall pdfminer.six
	pip install pdfminer.six

import %:
	pawls add $(path)
	pawls preprocess pdfplumber skiff_files/apps/pawls/papers
	pawls assign skiff_files/apps/pawls/papers development_user@example.com --all

run:
	docker-compose up --build

status:
	pawls status skiff_files/apps/pawls/papers

export:
	pawls export skiff_files/apps/pawls/papers api/config/configuration.json skiff_files/apps/pawls/output coco

export-token:
	pawls export skiff_files/apps/pawls/papers api/config/configuration.json skiff_files/apps/pawls/output_tokens token
setup:
	pip install -r cli/requirements.txt
	cd cli && python setup.py install
	brew install poppler

import %:
	pawls add $(path)
	pawls preprocess pdfplumber skiff_files/apps/pawls/papers

run:
	docker-compose up --build
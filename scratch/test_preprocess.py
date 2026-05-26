import sys
import os

# Add bookbuilder to path
sys.path.insert(0, '/Users/kangs/code/github/bookbuilder')
from bookbuilder.gfm import preprocess_markdown_content

with open('scratch/test_toc.md', 'r') as f:
    content = f.read()

processed = preprocess_markdown_content(content, None, 'docx')
print(processed)

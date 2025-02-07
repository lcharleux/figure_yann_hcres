import os

# Define the directory containing the PDF files
pdf_directory = 'doc'

# Define the output HTML file
output_html = os.path.join(pdf_directory, 'index.html')

# Start the HTML content
html_content = '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PDF Documents</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #333; }
        ul { list-style-type: none; padding: 0; }
        li { margin: 10px 0; }
        a { text-decoration: none; color: #007BFF; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>PDF Documents</h1>
    <ul>
'''

# Scan the directory for PDF files
for filename in os.listdir(pdf_directory):
    if filename.endswith('.pdf'):
        file_path = os.path.join(pdf_directory, filename)
        html_content += f'        <li><a href="{file_path}" target="_blank">{filename}</a></li>\n'

# Close the HTML content
html_content += '''
    </ul>
</body>
</html>
'''

# Write the HTML content to the output file
with open(output_html, 'w') as file:
    file.write(html_content)

print(f'HTML file "{output_html}" has been created successfully.')
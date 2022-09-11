FROM python:3.9 
# Or any preferred Python version.
ADD hello.py .
RUN pip install flask requests beautifulsoup4 python-dotenv
CMD ["python", "./hello.py"] 
# Or enter the name of your unique directory and parameter set.
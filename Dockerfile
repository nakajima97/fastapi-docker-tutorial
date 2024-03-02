# 公式のpython3.9を使う
FROM python:3.9
# 作業ディレクトリに/codeを指定
WORKDIR /code
# ホストのrequirements.txtを/codeにコピー
COPY ./requirements.txt /code/requirements.txt
# requirements.txtに書かれているライブラリのインストール
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
# ホストのappディレクトリを/code/appにコピー
COPY ./app /code/app
# uvicornでapp/main.pyを実行
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
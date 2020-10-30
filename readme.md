# growi-podman

Podmanを使用したgrowiのクイックスタート

# 事前準備
growi-podmanのディレクトリ内にgrowi-docker-composeをcloneする
```shell
git clone https://github.com/weseek/growi-docker-compose.git
```

# 実行手順
1. はじめにelasticsearchのコンテナをビルドする

```shell
./image_build.sh
```

2. 続いて，必要なファイルとディレクトリを作成し，権限を設定する

```shell
mkdir /var/wiki
mkdir /var/wiki/growi
mkdir /var/wiki/configdb
mkdir /var/wiki/db
mkdir /var/wiki/elasticsearch/data
chmod 777 -R /var/wiki/elasticsearch/
cp ./growi-docker-compose/elasticsearch/config/elasticsearch.yml /var/wiki/elasticsearch/elasticsearch.yml
chmod 666 /var/wiki/elasticsearch/elasticsearch.yml
```

3. SELinuxを有効にしている場合はこのコマンドでpodmanからのアクセスができるようにしておく

```shell
sudo chcon -R -h -t container_file_t /var/wiki
```

4. growi-podman.ymlファイル内のPASSWORD_SEEDを変更する。

5. 必要に応じてyamlファイル内のhostPathの部分も変更する

6. podmanでpodを立ち上げる

```shell
podman play kube growi-podman.yml
```



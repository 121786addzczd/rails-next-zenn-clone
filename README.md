## railsサーバー起動
まずはコンテナ起動
```bash
docker compose up -d
```
コンテナ起動したらrailsコンテナに対してrailsサーバーを起動するコマンドを実行
```bash
docker compose exec rails bash -c "rm -f tmp/pids/server.pid && rails s -b '0.0.0.0'"
```

フロントアンドのアプリケーションを起動する(新しいターミナルで実行してください。)
```bash
docker compose exec next bash -c "npm run dev"
```
npm run devでサーバーを起動した後、http://localhost:8000 からアクセスができます


rails-next-zenn-clone直下で以下を実行し新規Railsアプリを作成。
```shell
docker compose run --rm rails rails new . --force --api --database=mysql --skip-action-cable --skip-sprockets --skip-turbolinks --skip-webpack-install --skip-test --skip-bundle
```
| オプション | 効果 |
| --- | --- |
|--force | 生成ファイルと同名のファイルが存在する場合は上書きする |
|--api | APIモードのRailsアプリとして新規作成する |
|--database=mysql | DBとしてMySQLを利用する |
|--skip-action-cable | Action Cable関連の設定ファイルの作成をスキップする |
|--skip-sprockets | Sprockets の設定をスキップする |
|--skip-turbolinks | Turbolinks の設定をスキップする |
|--skip-webpack-install | webpackのインストールをスキップする |
|-skip-test | minitest の設定をスキップする |
|--skip-bundle|新規作成時のbundle install実行をスキップする|

コマンドを実行してしばらく待つと、railsディレクトリ配下にRailsアプリが新規作成される(初回実行時はdockerイメージのダウンロードなどもあわせて行われるため、結構時間がかかる)

この後、rails-next-zenn-cloneディレクトリの単位でGit管理していくため、自動作成されるrails/.gitは削除する
```bash
rm -rf rails/.git
```
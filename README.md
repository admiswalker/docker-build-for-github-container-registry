# docker-build-for-github-container-registry

## 手動手順

1. Personal Access Token(PAT)の発行
   1. 「1. GitHub で、任意のページの右上隅にある自分のプロフィール写真をクリックしてから、 [設定] をクリック」
   1. 「左側のサイドバーで [開発者設定] をクリック」
   1. 「Personal access tokens」→「Tokens (classic)」をクリック
   1. 「[新しいトークンの生成] をクリック」
   1. 下記にチェック
      - ✅ workflow
      - ✅ write:packages
        - ✅ read:packages
      - ✅ delete:packages
   Note: Token は後から参照できないので，適切な場所に控えておく．紛失した際の影響を減らすため 7 日程度の短い期間を設定しておく
   Ref: [personal access token (classic) の作成](https://docs.github.com/ja/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#personal-access-token-classic-%E3%81%AE%E4%BD%9C%E6%88%90)
1. ghcrにログイン
   ```bash
   GHCR_TOKEN=XXXXX
   GHCR_USERNAME=admiswalker
   docker login ghcr.io -u ${GHCR_USERNAME} -p ${GHCR_TOKEN}
   ```
1. Docker build
   push したい Docker イメージを build する
1. Docker push
   Format: `ghcr.io/<USERNAME>/<IMAGENAME>:TAG`
   ```bash
   GHCR_USERNAME=admiswalker
   docker tag raspberry_pi/raspios_full_arm64:2022-04-04_bullseye ghcr.io/${GHCR_USERNAME}/raspios_full_arm64_2022-04-04_bullseye:2024-08-12-update
   docker push ghcr.io/${GHCR_USERNAME}/raspios_full_arm64_2022-04-04_bullseye:2024-08-12-update
   ```

Ref:
- [GitHub Container Registry(ghcr)でコンテナイメージを管理する](https://qiita.com/Jazuma/items/aca397e081a7825d0dec)

## GitHub Actions

手動で Docker image を push すると，GitHub の Packages の画面に Docker リポジトリの管理画面が表示されるようになるので，下記を実施する．
1. デフォルトだと Private なので，Public 公開に変更しておく（今回は見られて困らないデータのため，制限のない Public にした方がよい）
1. 管理画面から GitHub Actions で自動 Build & Push するリポジトリに Write 権限を付与する．

なお，権限がないと下記のエラーが出る．

```bash
docker push ghcr.io/admiswalker/raspios_full_arm64_2022-04-04_bullseye:2024-08-12-update-tmp
```
```bash
denied: installation not allowed to Write organization package
```

Ref:
- [GitHub Action で GHCR へのコンテナー イメージの Push が成功しない (permission_denied: write_package)](https://blog.yukirii.dev/github-action-ghcr-push-error/)
- [GitHub Container Registry に自作の Docker イメージを公開する](https://zenn.dev/515hikaru/articles/migrate-to-ghcr)


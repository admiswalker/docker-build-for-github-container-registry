# docker-build-for-github-container-registry

## 手動手順

1. Personal Access Token(PAT)の発行
   1. 「1. GitHub で、任意のページの右上隅にある自分のプロフィール写真をクリックしてから、 [設定] をクリック」
   1. 「左側のサイドバーで [開発者設定] をクリック」
   1. 「Personal access tokens」→「Tokens (classic)」をクリック
   1. 「[新しいトークンの生成] をクリック」
   1. 下記にチェック
      ✅ workflow
      ✅ write:packages
        ✅ read:packages
      ✅ delete:packages
   Note: Token は後から参照できないので，適切な場所に控えておく
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

# Ref

- [GitHub Container Registry(ghcr)でコンテナイメージを管理する](https://qiita.com/Jazuma/items/aca397e081a7825d0dec)


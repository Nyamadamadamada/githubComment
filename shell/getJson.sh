#!/bin/bash

# 認証
# ログインしてなければ、ログインさせる
gh auth status
gh auth login

# {owner}/{repo}/　を対話で聞く
# .envでも設定できる

# gh api repos/Nyamadamadamada/React_Firebase/pulls/comments
## jsonを結果置き場に置く

# リプライ込み、レビューコメント。
gh api graphql -F owner='Nyamadamadamada' -F name='React_Firebase' -f query='
query($name: String!, $owner: String!){
  repository(owner: $owner, name: $name) {
    pullRequests(first: 10,orderBy: {field: CREATED_AT, direction: DESC}) {
      nodes {
        url
        title
        createdAt
        author {
          login
        }
        reviews(first: 10) {
          edges {
            node {
              comments(first: 25) {
                edges {
                  node {
                    databaseId
                    bodyText
                    diffHunk
                    createdAt
                    path
                    author {
                      login
                    }
                    replyTo {
                      databaseId
                      bodyText
                      diffHunk
                      createdAt
                      path
                      author {
                        login
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}'

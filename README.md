|            |          |                       |                         |
| ---------- | -------- | --------------------- | ----------------------- |
| Task       |          |                       |                         |
| title      | string   | null:false            |                         |
| content    | text     | null:false            |                         |
| created_at | datetime | null: false           | precision: 6            |
| updated_at | datetime | null: false           | precision: 6            |
| end_date   | datetime | null: false           | default: -> { "now()" } |
| status     | integer  | null: false           |                         |
| priority   | integer  | null: false           |                         |
| ["status"] | index    | index_tasks_on_status |                         |
| ["title"]  | index    | index_tasks_on_title  |                         | 


| Herokuへのデプロイ手順                                   |
| -------------------------------------------------------- |
| デプロイ用のアプリケーションを用意する                   |
| Herokuに新しいアプリケーションを作成する（heroku create) |
| コミットする                                             |
| Heroku buildpackを追加する                               |
| Herokuにデプロイをする                                   |

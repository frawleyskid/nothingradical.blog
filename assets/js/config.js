const hyvorCommentConfig = {
  url: {{ .Page.Permalink | jsonify }},
  id: {{ .Params.id | jsonify }},
  title: {{ .Params.title | jsonify }},
  authorEmail: {{ .Params.author.email | jsonify }},
};
var HYVOR_TALK_WEBSITE = {{ .Site.Params.comments.hyvor.siteid | jsonify }};
var HYVOR_TALK_CONFIG = {
  url: {{ .Page.Permalink | jsonify }},
  id: {{ .Params.id | jsonify }},
  title: {{ .Params.title | jsonify }},
  authorEmail: {{ .Params.author.email | jsonify }},
};
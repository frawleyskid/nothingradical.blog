const hyvorCommentConfig = {
  url: {{ .Page.Permalink | jsonify }},
  id: {{ .Params.id | jsonify }},
  title: {{ .Params.title | jsonify }},
  authorEmail: {{ .Params.author.email | jsonify }},
};

const hyvorCommentLightPalette = {
  accent: "#000000",
  accentText: "#ffffff",
  footerHeader: "#fafafa",
  footerHeaderText: "#484848",
  box: "#ffffff",
  boxText: "#111111",
  boxLightText: "#aaaaaa",
  backgroundText: "#111111"
};

const hyvorCommentDarkPalette = {
  accent: "#ffffff",
  accentText: "#000000",
  footerHeader: "#424242",
  footerHeaderText: "#cac7c7",
  box: "#606060",
  boxText: "#ffffff",
  boxLightText: "#aaaaaa",
  backgroundText: "#ffffff",
};

window.addEventListener("onColorSchemeChange", (event) => {
  hyvor_talk.setPalette(event.detail === "light" ? hyvorCommentLightPalette : hyvorCommentDarkPalette);
});
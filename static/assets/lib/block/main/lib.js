window.lib = function(arg$){
  var def, i18n;
  def = arg$.def, i18n = arg$.i18n;
  return {
    idx: function(arg$){
      var prj, idx;
      prj = arg$.prj;
      idx = (prj.system || {}).idx;
      if (!(idx != null)) {
        return '???';
      } else if (isNaN(idx)) {
        return idx;
      } else {
        return "111-" + (idx + "").padStart(3, "0");
      }
    },
    info: function(arg$){
      var prj, _, form, data;
      prj = arg$.prj;
      _ = function(v){
        return (v ? v.v : v) || 'n/a';
      };
      form = prj.detail.custom[def.config.alias || def.slug] || {};
      data = {
        name: _(form["專案名稱"]),
        description: _(form["專案簡介"]),
        team: {
          taxid: "",
          name: "",
          pic: _(form["專案代表人"])
        },
        contact: {
          email: "",
          name: _(form["專案代表人"]),
          mobile: "",
          title: "",
          addr: ""
        },
        budget: {
          total: +_(form["專案總經費"]),
          "expected-subsidy": +_(form["補助款金額"])
        }
      };
      return data;
    }
  };
};

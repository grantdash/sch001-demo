window.lib = ({def, i18n}) ->
  idx: ({prj}) ->
    idx = (prj.system or {}).idx
    if !(idx?) => \???
    else if isNaN(idx) => idx
    else "111-" + "#idx".padStart(3, "0")
  info: ({prj}) ->
    _ = (v) -> (if v => v.v else v) or 'n/a'
    form = prj.detail.custom[def.config.alias or def.slug] or {}
    data =
      name: _(form["專案名稱"])
      description: _(form["專案簡介"])
      team:
        taxid: ""
        name: ""
        pic: _(form["專案代表人"])
      contact:
        email: ""
        name: _(form["專案代表人"])
        mobile: ""
        title: ""
        addr: ""
      budget:
        total: +_(form["專案總經費"])
        "expected-subsidy": +_(form["補助款金額"])
    return data

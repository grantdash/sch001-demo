module.exports = 
  pkg:
    name: "@jothon/sch001-2022"
    extend: name: "@grantdash/prj.tdb"
    dependencies: [
      {name: "ldview"}
    ]
    i18n:
      en: 
        "報名期間": "Asia Taipei 2022/01/01 00:00:00 - 2022/03/01 00:00:00 (CST)"
      "zh-TW":
        "報名期間": "台灣時間 2022/01/01 00:00:00 起至 2022/03/01 00:00:00 止"

  init: ({root, ctx, pubsub, i18n, t}) ->
    pubsub.fire \init, mod({ctx, t, root, pubsub, bi: @_instance})

mod = ({root, ctx, t, pubsub, bi}) ->
  {ldview, dayjs} = ctx
  root.style.visibility = \hidden
  info:
    subset: "basic"
    fields: fc
    deadline: "2099/03/01 00:00:00+08:00"
  init: (base) ->
    lc = {}
    fills =
      "brd-full-name": "2021 - 2022 零時小學校"
    @pubsub = pubsub
    @formmgr = base.formmgr
    for lng, res of i18n-resource =>
      block.i18n.add-resource-bundle lng, "", res, true, true

    @view = view = new ldview do
      init-render: false
      root: document.body
      handler:
        "percent-of-subsidy": ({node}) ->
          v = Math.ceil((lc["percent-of-subsidy"] or 0) * 100)
          node.classList.toggle \text-danger, (v > 49)
          v = (Math.ceil((lc["percent-of-subsidy"] or 0) * 10000) / 100).toFixed(2)
          node.innerText = v
        "fill": ({node}) -> node.innerText = fills[node.getAttribute(\data-name)] or "?"
    @formmgr.on \change, ->
    view.init!then ->
      pubsub.on \after.load, ->
        <[專案總經費 自籌款金額]>.map ->
          fc[it].itf.on \change, ->
            total = fc["專案總經費"].itf.content!
            self-financing = fc["自籌款金額"].itf.content!
            grant = total - self-financing
            fc["補助款金額"].itf.value {v: grant}
            fc["補助款金額"].itf.render!
            lc["percent-of-subsidy"] = grant / total
            view.render \percent-of-subsidy
    bi.transform \i18n
    root.style.visibility = \visible

  render: ->

  brief: ->



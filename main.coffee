url = "http://lite.yelp.com/search?find_desc=pizza&find_loc=94040&find_submit=Search"

main = (page) ->
  results = page.evaluate ->
    list = $("address")
    Array::slice.call(list).map (e) ->
      e.innerText
  page.render('screenshot.png');
  console.log results.join("\n")

page = require("webpage").create()
page.open url, (status) ->
  console.log "Unable to access network" unless status is "success"
  page.includeJs "http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js", ->
    main(page)
    phantom.exit()
    return

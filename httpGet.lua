http.get("http://nickjgniklu.github.io/carHorn/index.html", nill, function(code, data)
    if (code < 0) then
      print("HTTP request failed")
    else
      print(code, data)
    end
  end)
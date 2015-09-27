
Template.registerHelper 'formatAmount', (val) ->
  tmp = val.toString()
  grps = (tmp.slice(-3*(i+1), -3*i) for i in [1...(tmp.length)/3])
  grps.reverse()
  grps.push tmp.slice(-3)
  return grps.join ','

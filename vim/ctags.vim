" Scala
--langdef=scala
--langmap=scala:.scala
--regex-scala=/^[ \t  ]*((abstract|final|sealed|implicit|lazy)[ \t  ]*)*(private|protected)?[ \t  ]*class[ \t  ]+([a-zA-Z0-9_]+)/\4/c,classes/
--regex-scala=/^[ \t  ]*((abstract|final|sealed|implicit|lazy)[ \t  ]*)*(private|protected)?[ \t  ]*object[ \t  ]+([a-zA-Z0-9_]+)/\4/c,objects/
--regex-scala=/^[ \t  ]*((abstract|final|sealed|implicit|lazy)[ \t  ]*)*(private|protected)?[ \t  ]*case class[ \t  ]+([a-zA-Z0-9_]+)/\4/c,case classes/
--regex-scala=/^[ \t  ]*((abstract|final|sealed|implicit|lazy)[ \t  ]*)*(private|protected)?[ \t  ]*case object[ \t  ]+([a-zA-Z0-9_]+)/\4/c,case objects/
--regex-scala=/^[ \t  ]*((abstract|final|sealed|implicit|lazy)[ \t  ]*)*(private|protected)?[ \t  ]*trait[ \t  ]+([a-zA-Z0-9_]+)/\4/t,traits/
--regex-scala=/^[ \t  ]*type[ \t  ]+([a-zA-Z0-9_]+)/\1/T,types/
--regex-scala=/^[ \t  ]*((abstract|final|sealed|implicit|lazy)[ \t  ]*)*def[ \t  ]+([a-zA-Z0-9_]+)/\3/m,methods/
--regex-scala=/^[ \t  ]*((abstract|final|sealed|implicit|lazy)[ \t  ]*)*val[ \t  ]+([a-zA-Z0-9_]+)/\3/l,constants/
--regex-scala=/^[ \t  ]*((abstract|final|sealed|implicit|lazy)[ \t  ]*)*var[ \t  ]+([a-zA-Z0-9_]+)/\3/l,variables/
--regex-scala=/^[ \t  ]*package[ \t  ]+([a-zA-Z0-9_.]+)/\1/p,packages/

" TS
--langdef=typescript
--langmap=typescript:.ts
--regex-typescript=/^[ \t ]*(export)?[ \t ]*class[ \t ]+([a-zA-Z0-9_]+)/\2/c,classes/
--regex-typescript=/^[ \t ]*(export)?[ \t ]*abstract class[ \t ]+([a-zA-Z0-9_]+)/\2/a,abstract classes/
--regex-typescript=/^[ \t ]*(export)?[ \t ]*module[ \t ]+([a-zA-Z0-9_]+)/\2/n,modules/
--regex-typescript=/^[ \t ]*(export)?[ \t ]*type[ \t ]+([a-zA-Z0-9_]+)/\2/t,types/
--regex-typescript=/^[ \t ]*(export)?[ \t ]*namespace[ \t ]+([a-zA-Z0-9_]+)/\2/n,modules/
--regex-typescript=/^[ \t ]*(export)?[ \t ]*function[ \t ]+([a-zA-Z0-9_]+)/\2/f,functions/
--regex-typescript=/^[ \t ]*export[ \t ]+var[ \t ]+([a-zA-Z0-9_]+)/\1/v,variables/
--regex-typescript=/^[ \t ]*var[ \t ]+([a-zA-Z0-9_]+)[ \t ]*=[ \t ]*function[ \t ]*\(\)/\1/l,varlambdas/
--regex-typescript=/^[ \t ]*(export)?[ \t ]*(public|private)[ \t ]+(static)?[ \t ]*([a-zA-Z0-9_]+)/\4/m,members/
--regex-typescript=/^[ \t ]*(export)?[ \t ]*interface[ \t ]+([a-zA-Z0-9_]+)/\2/i,interfaces/
--regex-typescript=/^[ \t ]*(export)?[ \t ]*enum[ \t ]+([a-zA-Z0-9_]+)/\2/e,enums/

" Exclusions
--exclude=target
--exclude=.git
--exclude=.svn
--exclude=.hg
--exclude=node_modules
--exclude=bundle.js
--exclude=*.js.map
--exclude=*.min.*
--exclude=*.swp
--exclude=*.bak
--exclude=*.tar.*

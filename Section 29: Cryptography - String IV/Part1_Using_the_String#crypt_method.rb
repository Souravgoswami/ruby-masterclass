#!/usr/bin/ruby -w
# Encoding: UTF-8
# Sun Jul 21 05:17:32 2019
# ruby 2.6.3
# PART 1

# The crypt method returns a crypted string:
p ?H.crypt('$6$salt')                           # => "$6$salt$FqsYkOri8GBmSiDe/wjZeax4RnMpXuXiCYF4Ha5wf8lUWDzRe8CD6jOsQ6lTpkfLA08aEMnsrxYwci3otzsNx1"

# This will be same across devices
p 'Hi'.crypt('$6$salt')                         # => "$6$salt$ZAOu5EmJHAn1xULsh3He3AxemJOlw6q9Fb6ec9UdE3T2TabgiAiwME.oiRxVWsT0lA7VyhPdchLvqbnPVvMnv0"

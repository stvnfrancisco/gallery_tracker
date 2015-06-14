Note to Mike: I managed to get everything working yesterday aside from deleting artworks from the lists within the museums. I can delete the enitre museum... I'm waiting for my review before I push my most current edits. The main error is on line 32 in app.rb... I misspelled the instance variable @museum on that line. I also forgot to close out a couple lines for some submit buttons.

Title: Museum Tracker

by: Steven Francisco

This app will allow the user to add museums and artworks to a database, and add artworks to the museums.

Built using Ruby ver.: ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-darwin14]

Please Bundle install the following Gems: 'sinatra' 'sinatra-contrib' 'rspec' 'capybara' 'pry'

MIT License: Copyright (c) 2015

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Museum Tracker Database setup instructions:

Start the postgres server and open another tab to run psql:

guest=# CREATE DATABASE museum_tracker;
<br>
guest=# CREATE TABLE museums (id serial PRIMARY KEY, name varchar);
<br>
guest=# CREATE TABLE artworks (id serial PRIMARY KEY, museum_id int, name varchar);
<br>
guest=# CREATE DATABASE museum_tracker_test WITH TEMPLATE museum_tracker;
<br>
guest=# \c museum_tracker_test
<br>
museum_tracker_test=#

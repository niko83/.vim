NAME=$1
echo "=================="
echo $NAME
git log --author=$NAME  --since="1 Jan, 2019" --before "1 Feb 2019" --numstat | grep "\.py" | grep -v "db/versions" | grep -v "test" | ./stat.py 
git log --author=$NAME  --since="1 Feb, 2019" --before "1 Mar 2019" --numstat | grep "\.py" | grep -v "db/versions" | grep -v "test" | ./stat.py 
git log --author=$NAME  --since="1 Mar, 2019" --before "1 Apr 2019" --numstat | grep "\.py" | grep -v "db/versions" | grep -v "test" | ./stat.py 
git log --author=$NAME  --since="1 Apr, 2019" --before "1 May 2019" --numstat | grep "\.py" | grep -v "db/versions" | grep -v "test" | ./stat.py 
git log --author=$NAME  --since="1 May, 2019" --before "1 Jun 2019" --numstat | grep "\.py" | grep -v "db/versions" | grep -v "test" | ./stat.py 
git log --author=$NAME  --since="1 Jun, 2019" --before "1 Jul 2019" --numstat | grep "\.py" | grep -v "db/versions" | grep -v "test" | ./stat.py 
git log --author=$NAME  --since="1 Jul, 2019" --before "1 Aug 2019" --numstat | grep "\.py" | grep -v "db/versions" | grep -v "test" | ./stat.py 
git log --author=$NAME  --since="1 Aug, 2019" --before "1 Sep 2019" --numstat | grep "\.py" | grep -v "db/versions" | grep -v "test" | ./stat.py 
git log --author=$NAME  --since="1 Sep, 2019" --before "1 Oct 2019" --numstat | grep "\.py" | grep -v "db/versions" | grep -v "test" | ./stat.py 

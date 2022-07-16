# ./run.sh (badger|mongodb|other dbs)
if [ "$#" -ne 1 ]
then
	echo "input not correct, requires command line argument (etc: ./run.sh badger)"
else
	echo "Running benchmark for :" $1
	./bin/go-ycsb load $1 -P workloads/workloada
	./bin/go-ycsb load $1 -P workloads/workloadb
	./bin/go-ycsb load $1 -P workloads/workloadc
	./bin/go-ycsb load $1 -P workloads/workloadd
	./bin/go-ycsb load $1 -P workloads/workloade
	./bin/go-ycsb load $1 -P workloads/workloadf

	./bin/go-ycsb run $1 -P workloads/workloada
	./bin/go-ycsb run $1 -P workloads/workloadb
	./bin/go-ycsb run $1 -P workloads/workloadc
	./bin/go-ycsb run $1 -P workloads/workloadd
	./bin/go-ycsb run $1 -P workloads/workloade
	./bin/go-ycsb run $1 -P workloads/workloadf
fi

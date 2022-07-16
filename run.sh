# ./run.sh (badger|mongodb|other dbs)
make
if [ "$#" -ne 1 ]
then
	echo "input not correct, requires command line argument (etc: ./run.sh badger)"
else
	echo "Running benchmark for :" $1
	echo "workload a"
	./bin/go-ycsb load $1 -P workloads/workloada
	./bin/go-ycsb run $1 -P workloads/workloada
	
	echo "workload b"
	./bin/go-ycsb load $1 -P workloads/workloadb
	./bin/go-ycsb run $1 -P workloads/workloadb
	
	echo "workload c"
	./bin/go-ycsb load $1 -P workloads/workloadc
	./bin/go-ycsb run $1 -P workloads/workloadc
	
	echo "workload d"
	./bin/go-ycsb load $1 -P workloads/workloadd
	./bin/go-ycsb run $1 -P workloads/workloadd

	echo "workload e"
	./bin/go-ycsb load $1 -P workloads/workloade
	./bin/go-ycsb run $1 -P workloads/workloade
	
	echo "workload f"
	./bin/go-ycsb load $1 -P workloads/workloadf
	./bin/go-ycsb run $1 -P workloads/workloadf
fi

## Easy parallelization ways
---
## Problems
* Marginal only improvement of command parallelization at the CPU level
* Transistor heat
* Stagnant CPU clock frequency 
* Multiple (unexploited) CPU cores
---
## Parallelization is tough
* Our conscious thought processes are sequential
* The Amdahl law restricts performance speedup
* The road is full of traps
* Race condition
* Deadlock
* Livelock
---
## The hard solutions
* Multiple threads
* OpenMP
* Programming languages
 * Scala
 * Haskell
 * Clojure
 * F#
 * Erlang
 * R (parallel)
---
## The easy solutions
* Specialized platforms
* Multiple processes
* Multiple threads
---
## Specialized platforms
* Databases
* Web-centric development
* Cloud services
---
## In the Unix context
* Without dependencies
 * xargs -P
 * GNU Parallel
* With dependencies
 * Pipes
 * make -j
---
## GNU parallel examples
* Parallelized image decompression
```
find . -name '*.jpeg' |
parallel 'djpeg -scale 1/16 {} |
  cjpeg -outfile thumb/{}'
```
* Parallelized file analysis
```
cat access_log* |
parallel --pipe print_user_agent
```
---
## Libraries map, filter, reduce
* C++
 * QtConcurrent
* Java 8
 * java.util.streams
```
sales.parallelStream().
	map(s -> s.price).
	average().
	getAsDouble();
```
* .NET
 * PLINQ
---
## Specialized libraries
* AMD Framewave
* Intel Integrated Performance Primitives
* Cover:
 * Image and audio processing
 * Video coding and decoding
 * Signal processing
 * Cryptography
 * Compression
 * Image creation (rendering)
* NAG: Numerical and statistical processing
---
## Cloud services
Examples AWS:

* Elastic map reduce (Hadoop)
* Lambda (event-driven code)
* Elastic transcoder
* Kinesis (streaming big data processing)

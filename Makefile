 ##
##

CXX	=g++
##
## Use our standard compiler flags for the course...
## You can try changing these flags to improve performance.
##
CXXFLAGS= -g -O4 -fno-omit-frame-pointer -Wall -fopenmp

goals: judge
	@echo "Done"

filter: FilterMain.cpp Filter.cpp cs1300bmp.cc cs1300bmp.h Filter.h rdtsc.h
	$(CXX) $(CXXFLAGS) -o filter FilterMain.cpp Filter.cpp cs1300bmp.cc

##
## Parameters for the test run
##
FILTERS = gauss.filter vline.filter hline.filter emboss.filter
IMAGES = boats.bmp blocks-small.bmp
TRIALS = 1 2 3 4

judge: filter
	-./Judge -p ./filter -i boats.bmp
	-./Judge -p ./filter -i blocks-small.bmp

test:	filter
	./Judge -p ./filter -i boats.bmp
	./Judge -p ./filter -i blocks-small.bmp
	cmp filtered-avg-blocks-small.bmp tests/filtered-avg-blocks-small.bmp
	cmp filtered-avg-boats.bmp tests/filtered-avg-boats.bmp
	cmp filtered-emboss-blocks-small.bmp tests/filtered-emboss-blocks-small.bmp
	cmp filtered-emboss-boats.bmp tests/filtered-emboss-boats.bmp
	cmp filtered-gauss-blocks-small.bmp tests/filtered-gauss-blocks-small.bmp
	cmp filtered-gauss-boats.bmp tests/filtered-gauss-boats.bmp
	cmp filtered-hline-blocks-small.bmp tests/filtered-hline-blocks-small.bmp
	@echo All tests passed

clean:
	-rm -f *.o
	-rm -f filter
	-rm -f filtered-*.bmp
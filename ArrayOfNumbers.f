c method for searching for a number given an array, desired number and size
      INTEGER FUNCTION binarySearch(a,x,size)
c declaring array, min and max (used for search)
      INTEGER a(10), x, size
      INTEGER min, max
      min = 1
      max = size
c if size is greater than 1
   33 IF(min .LE. max) THEN
c then split array into two parts
         binarySearch = (min + max)/2
c if desired number is in element of array return (leave)
         IF(a(binarySearch) .EQ. x) THEN
            RETURN
c else if not found, increment min half of array (same for max half) and restart
         ELSEIF (a(binarySearch) .LT. x) THEN
            min = binarySearch + 1
         ELSE
            max = binarySearch - 1
         ENDIF
      GOTO 33
      ENDIF
      binarySearch = -1
      RETURN
      END

c subroutine (method) for 
c sorting array an array given array and size
      SUBROUTINE insertionSort(a,size)
      INTEGER size, a(size), temp, k, j
c essentially it's two nested for loops for iterating over each element and comparing it
c to the rest of the array, swapping when necessary
      DO 11 k = 1, size-1
        DO 22 j = k + 1, size
           IF(a(k) .GT. a(j)) THEN
              temp = a(k)
              a(k) = a(j)
              a(j) = temp
           ENDIF
   22   CONTINUE
   11 CONTINUE
      RETURN
      END

c Program ArrayOfNumbers
c - Uses insertion sort to sort inputted array, then asks
c - user for element values to fill the array.
c - Asks user for desired element and displays it, does this until exit.
      PROGRAM ArrayOfNumbers
      INTEGER size, i, temp, a(10), binarySearch, d_num
      PRINT *, 'Enter size of the array: '
      READ (*,*) size
      PRINT *, 'Enter its values: '
      do 44 i=1, size, 1
         READ (*,*) temp
         a(i) = temp
   44 CONTINUE
c sort array via subroutine
      call insertionSort(a,size)
      PRINT *, 'Sorted array: '
c display sorted array
      do 55 i=1, size, 1
          WRITE (*,*) a(i)
   55 CONTINUE

   66 IF(1 .EQ. 1) THEN
c input saved into temp
         PRINT *, 'Enter desired number to search or type -1 to quit.'
         READ(*,*) temp
c if input is -1, then quit, else retrieve index of desired number through binarysearch
c desired number is saved into temp, index location into d_num
         IF(temp .EQ. -1) THEN
            GOTO 77
         ELSE
            loc = binarySearch(a,temp,size)
         ENDIF
c if desired number search failed (-1) then display error message
         IF(loc.EQ. -1) THEN
            PRINT *, 'Desired number is not in the array. Try again.'
         ELSE
            WRITE(*,*) 'Desired number has location of: ', loc
         ENDIF

      GOTO 66
   77 ENDIF
      PRINT *, 'Program Exited'
      STOP
      END








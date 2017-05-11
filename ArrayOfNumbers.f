c binarySearch function
      INTEGER FUNCTION binarySearch(a,x,size)
      INTEGER a(10), x, size
      INTEGER min, max
      min = 1
      max = size
   33 IF(min .LE. max) THEN
         binarySearch = (min + max)/2

         IF(a(binarySearch) .EQ. x) THEN
            RETURN
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

c Sort array via insertionsort
      SUBROUTINE insertionSort(a,size)
      INTEGER size, a(size), temp, k, j
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

      call insertionSort(a,size)
      PRINT *, 'Sorted array: '
      do 55 i=1, size, 1
          WRITE (*,*) a(i)
   55 CONTINUE

   66 IF(1 .EQ. 1) THEN
         PRINT *, 'Enter desired number to search or type -1 to quit.'
         READ(*,*) temp
         IF(temp .EQ. -1) THEN
            GOTO 77
         ELSE
            d_num = binarySearch(a,temp,size)
         ENDIF

         IF(d_num.EQ. -1) THEN
            PRINT *, 'Desired number is not in the array. Try again.'
         ELSE
            WRITE(*,*) 'Desired number has location of: ', d_num
         ENDIF

      GOTO 66
   77 ENDIF
      PRINT *, 'Program Exited'
      STOP
      END








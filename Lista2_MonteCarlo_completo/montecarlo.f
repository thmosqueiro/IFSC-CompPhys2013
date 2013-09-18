! ===============================================
! 
! Na lista 2, foi pedido um programa pra calcular o volume
! de uma "esfera em N dimensoes" a partir de vetores cujas
! componentes eram geradas de forma uniforme. Publiquei no
! site uns graficos nesse sentido e como este projeto ja 
! finzaliou, disponibilizo meus codigos (tanto o metodo
! como os scripts para gerar graficos). Este algoritmo nao
! eh o mais eficiente possivel, principalmente porque
! o intuito nao estah apenas no calculo, mas tambem em gerar
! os dados que preciso pra montar os graficos. Alem disso,
! este programa eh especializado para o caso N=2, embora
! nao seja dificil generaliza-lo.
!
! No arquivo fort.1, estao os vetores que caem dentro do
! circulo unitario. No arquivo fort.2, estao os outros.
!
!
!
! Thiago Mosqueiro @ 2013
! Licensing: WTFPL
! tl;dr: "Do whatever you want, don't sue me'
!
! ===============================================
      
      
      
      real*8, allocatable  :: v(:)
      integer              :: N, d, conta
      real*8               :: r, oldf, f, delta
      
      
! Dimension of the vectors
      d = 2
      allocate( v(d) )
      
! Number of vectors to be generated
      N = 10000
      
! This will be the number of vectors found to be
! inside the unitary circle
      conta = 0
      
! This will be used to calculate how good our 
! approximation
      oldf = 0.d0
      
!
! Let's start the job...
!
      do j = 1, N
         
         ! Generating the vector and evaluating
         ! its squared norm
         r = 0.d0
         do k = 1, d
            v(k) = rand()
            r = r + v(k)**2
         enddo
         r = dsqrt(r)
         
         
         ! Testing if it's inside the circle    
         if ( r .le. 1.d0 ) then
            ! Inside the circle
            conta = conta + 1
            write(1,'(F7.5,2X,F7.5)') v(1), v(2)
         else
            ! Outside
            write(2,'(F7.5,2X,F7.5)') v(1), v(2)
         endif
         
         ! Frequency of finding vectors inside the circle
         f = dfloat(conta)/dfloat(j)
         
         ! The evolution of this frequency as the
         ! number of vectors grows.
         write(3,'(I6,5X,F7.6)') j, dabs(f-oldf)
         oldf = f
         
      enddo
      
      ! Finally writing our result.
      write(*,'(A8, F7.5)') "Fracao: ", f
      write(*,'(A8, F7.5)') "Area:   ", 2**(d)*f
      
      stop
      end

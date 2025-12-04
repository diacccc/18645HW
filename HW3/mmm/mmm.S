
./mmm.x:     file format elf64-x86-64


Disassembly of section .init:

0000000000400580 <_init>:
  400580:	f3 0f 1e fa          	endbr64 
  400584:	48 83 ec 08          	sub    $0x8,%rsp
  400588:	48 8b 05 61 1a 20 00 	mov    0x201a61(%rip),%rax        # 601ff0 <__gmon_start__@Base>
  40058f:	48 85 c0             	test   %rax,%rax
  400592:	74 02                	je     400596 <_init+0x16>
  400594:	ff d0                	callq  *%rax
  400596:	48 83 c4 08          	add    $0x8,%rsp
  40059a:	c3                   	retq   

Disassembly of section .plt:

00000000004005a0 <.plt>:
  4005a0:	ff 35 62 1a 20 00    	pushq  0x201a62(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  4005a6:	ff 25 64 1a 20 00    	jmpq   *0x201a64(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  4005ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004005b0 <free@plt>:
  4005b0:	ff 25 62 1a 20 00    	jmpq   *0x201a62(%rip)        # 602018 <free@GLIBC_2.2.5>
  4005b6:	68 00 00 00 00       	pushq  $0x0
  4005bb:	e9 e0 ff ff ff       	jmpq   4005a0 <.plt>

00000000004005c0 <puts@plt>:
  4005c0:	ff 25 5a 1a 20 00    	jmpq   *0x201a5a(%rip)        # 602020 <puts@GLIBC_2.2.5>
  4005c6:	68 01 00 00 00       	pushq  $0x1
  4005cb:	e9 d0 ff ff ff       	jmpq   4005a0 <.plt>

00000000004005d0 <printf@plt>:
  4005d0:	ff 25 52 1a 20 00    	jmpq   *0x201a52(%rip)        # 602028 <printf@GLIBC_2.2.5>
  4005d6:	68 02 00 00 00       	pushq  $0x2
  4005db:	e9 c0 ff ff ff       	jmpq   4005a0 <.plt>

00000000004005e0 <memset@plt>:
  4005e0:	ff 25 4a 1a 20 00    	jmpq   *0x201a4a(%rip)        # 602030 <memset@GLIBC_2.2.5>
  4005e6:	68 03 00 00 00       	pushq  $0x3
  4005eb:	e9 b0 ff ff ff       	jmpq   4005a0 <.plt>

00000000004005f0 <posix_memalign@plt>:
  4005f0:	ff 25 42 1a 20 00    	jmpq   *0x201a42(%rip)        # 602038 <posix_memalign@GLIBC_2.2.5>
  4005f6:	68 04 00 00 00       	pushq  $0x4
  4005fb:	e9 a0 ff ff ff       	jmpq   4005a0 <.plt>

0000000000400600 <rand@plt>:
  400600:	ff 25 3a 1a 20 00    	jmpq   *0x201a3a(%rip)        # 602040 <rand@GLIBC_2.2.5>
  400606:	68 05 00 00 00       	pushq  $0x5
  40060b:	e9 90 ff ff ff       	jmpq   4005a0 <.plt>

Disassembly of section .text:

0000000000400610 <main>:
  400610:	4c 8d 54 24 08       	lea    0x8(%rsp),%r10
  400615:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  400619:	ba 00 00 03 00       	mov    $0x30000,%edx
  40061e:	be 40 00 00 00       	mov    $0x40,%esi
  400623:	41 ff 72 f8          	pushq  -0x8(%r10)
  400627:	55                   	push   %rbp
  400628:	48 89 e5             	mov    %rsp,%rbp
  40062b:	41 54                	push   %r12
  40062d:	41 52                	push   %r10
  40062f:	48 8d 7d a8          	lea    -0x58(%rbp),%rdi
  400633:	53                   	push   %rbx
  400634:	31 db                	xor    %ebx,%ebx
  400636:	48 83 ec 58          	sub    $0x58,%rsp
  40063a:	e8 b1 ff ff ff       	callq  4005f0 <posix_memalign@plt>
  40063f:	ba 00 00 03 00       	mov    $0x30000,%edx
  400644:	be 40 00 00 00       	mov    $0x40,%esi
  400649:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
  40064d:	e8 9e ff ff ff       	callq  4005f0 <posix_memalign@plt>
  400652:	ba 00 40 00 00       	mov    $0x4000,%edx
  400657:	be 40 00 00 00       	mov    $0x40,%esi
  40065c:	48 8d 7d b8          	lea    -0x48(%rbp),%rdi
  400660:	e8 8b ff ff ff       	callq  4005f0 <posix_memalign@plt>
  400665:	ba 00 18 00 00       	mov    $0x1800,%edx
  40066a:	be 40 00 00 00       	mov    $0x40,%esi
  40066f:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
  400673:	e8 78 ff ff ff       	callq  4005f0 <posix_memalign@plt>
  400678:	ba 00 18 00 00       	mov    $0x1800,%edx
  40067d:	be 40 00 00 00       	mov    $0x40,%esi
  400682:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  400686:	e8 65 ff ff ff       	callq  4005f0 <posix_memalign@plt>
  40068b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400690:	e8 6b ff ff ff       	callq  400600 <rand@plt>
  400695:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
  400699:	c5 fb 2a c0          	vcvtsi2sd %eax,%xmm0,%xmm0
  40069d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  4006a1:	c5 fb 5e 05 5f 0a 00 	vdivsd 0xa5f(%rip),%xmm0,%xmm0        # 401108 <__dso_handle+0x90>
  4006a8:	00 
  4006a9:	c5 fb 11 04 18       	vmovsd %xmm0,(%rax,%rbx,1)
  4006ae:	48 83 c3 08          	add    $0x8,%rbx
  4006b2:	48 81 fb 00 00 03 00 	cmp    $0x30000,%rbx
  4006b9:	75 d5                	jne    400690 <main+0x80>
  4006bb:	31 db                	xor    %ebx,%ebx
  4006bd:	0f 1f 00             	nopl   (%rax)
  4006c0:	e8 3b ff ff ff       	callq  400600 <rand@plt>
  4006c5:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
  4006c9:	c5 fb 2a c0          	vcvtsi2sd %eax,%xmm0,%xmm0
  4006cd:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  4006d1:	c5 fb 5e 05 2f 0a 00 	vdivsd 0xa2f(%rip),%xmm0,%xmm0        # 401108 <__dso_handle+0x90>
  4006d8:	00 
  4006d9:	c5 fb 11 04 18       	vmovsd %xmm0,(%rax,%rbx,1)
  4006de:	48 83 c3 08          	add    $0x8,%rbx
  4006e2:	48 81 fb 00 40 00 00 	cmp    $0x4000,%rbx
  4006e9:	75 d5                	jne    4006c0 <main+0xb0>
  4006eb:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  4006ef:	ba 00 18 00 00       	mov    $0x1800,%edx
  4006f4:	31 f6                	xor    %esi,%esi
  4006f6:	bb a0 86 01 00       	mov    $0x186a0,%ebx
  4006fb:	45 31 e4             	xor    %r12d,%r12d
  4006fe:	e8 dd fe ff ff       	callq  4005e0 <memset@plt>
  400703:	b9 00 01 00 00       	mov    $0x100,%ecx
  400708:	ba 08 00 00 00       	mov    $0x8,%edx
  40070d:	31 c0                	xor    %eax,%eax
  40070f:	be 60 00 00 00       	mov    $0x60,%esi
  400714:	bf a8 10 40 00       	mov    $0x4010a8,%edi
  400719:	e8 b2 fe ff ff       	callq  4005d0 <printf@plt>
  40071e:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
  400722:	48 8b 7d b0          	mov    -0x50(%rbp),%rdi
  400726:	41 b8 00 01 00 00    	mov    $0x100,%r8d
  40072c:	b9 06 00 00 00       	mov    $0x6,%ecx
  400731:	ba 60 00 00 00       	mov    $0x60,%edx
  400736:	e8 05 05 00 00       	callq  400c40 <pack>
  40073b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  400740:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  400744:	ba 00 18 00 00       	mov    $0x1800,%edx
  400749:	31 f6                	xor    %esi,%esi
  40074b:	e8 90 fe ff ff       	callq  4005e0 <memset@plt>
  400750:	0f 31                	rdtsc  
  400752:	49 89 d0             	mov    %rdx,%r8
  400755:	89 c0                	mov    %eax,%eax
  400757:	31 f6                	xor    %esi,%esi
  400759:	49 c1 e0 20          	shl    $0x20,%r8
  40075d:	49 09 c0             	or     %rax,%r8
  400760:	48 8b 55 c0          	mov    -0x40(%rbp),%rdx
  400764:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
  400768:	c5 e9 57 d2          	vxorpd %xmm2,%xmm2,%xmm2
  40076c:	48 89 f0             	mov    %rsi,%rax
  40076f:	c5 fd 28 da          	vmovapd %ymm2,%ymm3
  400773:	48 c1 e0 05          	shl    $0x5,%rax
  400777:	c5 7d 28 c2          	vmovapd %ymm2,%ymm8
  40077b:	48 03 45 b0          	add    -0x50(%rbp),%rax
  40077f:	c5 fd 28 e2          	vmovapd %ymm2,%ymm4
  400783:	c5 7d 28 ca          	vmovapd %ymm2,%ymm9
  400787:	c5 fd 28 ea          	vmovapd %ymm2,%ymm5
  40078b:	48 01 f2             	add    %rsi,%rdx
  40078e:	48 8d b9 00 40 00 00 	lea    0x4000(%rcx),%rdi
  400795:	c5 7d 28 d2          	vmovapd %ymm2,%ymm10
  400799:	c5 fd 28 f2          	vmovapd %ymm2,%ymm6
  40079d:	c5 7d 28 da          	vmovapd %ymm2,%ymm11
  4007a1:	c5 fd 28 fa          	vmovapd %ymm2,%ymm7
  4007a5:	c5 7d 28 e2          	vmovapd %ymm2,%ymm12
  4007a9:	c5 fd 28 c2          	vmovapd %ymm2,%ymm0
  4007ad:	0f 1f 00             	nopl   (%rax)
  4007b0:	c5 7d 28 69 20       	vmovapd 0x20(%rcx),%ymm13
  4007b5:	c5 fd 28 09          	vmovapd (%rcx),%ymm1
  4007b9:	48 81 c1 00 01 00 00 	add    $0x100,%rcx
  4007c0:	48 05 c0 00 00 00    	add    $0xc0,%rax
  4007c6:	c4 62 7d 19 b0 40 ff 	vbroadcastsd -0xc0(%rax),%ymm14
  4007cd:	ff ff 
  4007cf:	c4 62 7d 19 78 98    	vbroadcastsd -0x68(%rax),%ymm15
  4007d5:	c4 e2 8d b8 c1       	vfmadd231pd %ymm1,%ymm14,%ymm0
  4007da:	c4 42 8d b8 e5       	vfmadd231pd %ymm13,%ymm14,%ymm12
  4007df:	c4 62 7d 19 b0 48 ff 	vbroadcastsd -0xb8(%rax),%ymm14
  4007e6:	ff ff 
  4007e8:	c4 e2 8d b8 f9       	vfmadd231pd %ymm1,%ymm14,%ymm7
  4007ed:	c4 42 8d b8 dd       	vfmadd231pd %ymm13,%ymm14,%ymm11
  4007f2:	c4 62 7d 19 b0 50 ff 	vbroadcastsd -0xb0(%rax),%ymm14
  4007f9:	ff ff 
  4007fb:	c4 e2 8d b8 f1       	vfmadd231pd %ymm1,%ymm14,%ymm6
  400800:	c4 42 8d b8 d5       	vfmadd231pd %ymm13,%ymm14,%ymm10
  400805:	c4 62 7d 19 b0 58 ff 	vbroadcastsd -0xa8(%rax),%ymm14
  40080c:	ff ff 
  40080e:	c4 e2 8d b8 e9       	vfmadd231pd %ymm1,%ymm14,%ymm5
  400813:	c4 42 8d b8 cd       	vfmadd231pd %ymm13,%ymm14,%ymm9
  400818:	c4 62 7d 19 b0 60 ff 	vbroadcastsd -0xa0(%rax),%ymm14
  40081f:	ff ff 
  400821:	c4 e2 8d b8 e1       	vfmadd231pd %ymm1,%ymm14,%ymm4
  400826:	c4 42 8d b8 c5       	vfmadd231pd %ymm13,%ymm14,%ymm8
  40082b:	c4 62 7d 19 b0 68 ff 	vbroadcastsd -0x98(%rax),%ymm14
  400832:	ff ff 
  400834:	c4 c2 e5 98 ce       	vfmadd132pd %ymm14,%ymm3,%ymm1
  400839:	c4 c2 8d b8 d5       	vfmadd231pd %ymm13,%ymm14,%ymm2
  40083e:	c4 e2 7d 19 98 70 ff 	vbroadcastsd -0x90(%rax),%ymm3
  400845:	ff ff 
  400847:	c5 7d 28 b1 40 ff ff 	vmovapd -0xc0(%rcx),%ymm14
  40084e:	ff 
  40084f:	c5 7d 28 a9 60 ff ff 	vmovapd -0xa0(%rcx),%ymm13
  400856:	ff 
  400857:	c4 c2 e5 b8 c6       	vfmadd231pd %ymm14,%ymm3,%ymm0
  40085c:	c4 42 e5 b8 e5       	vfmadd231pd %ymm13,%ymm3,%ymm12
  400861:	c4 e2 7d 19 98 78 ff 	vbroadcastsd -0x88(%rax),%ymm3
  400868:	ff ff 
  40086a:	c4 c2 e5 b8 fe       	vfmadd231pd %ymm14,%ymm3,%ymm7
  40086f:	c4 42 e5 b8 dd       	vfmadd231pd %ymm13,%ymm3,%ymm11
  400874:	c4 e2 7d 19 58 80    	vbroadcastsd -0x80(%rax),%ymm3
  40087a:	c4 c2 e5 b8 f6       	vfmadd231pd %ymm14,%ymm3,%ymm6
  40087f:	c4 42 e5 b8 d5       	vfmadd231pd %ymm13,%ymm3,%ymm10
  400884:	c4 e2 7d 19 58 88    	vbroadcastsd -0x78(%rax),%ymm3
  40088a:	c4 c2 e5 b8 ee       	vfmadd231pd %ymm14,%ymm3,%ymm5
  40088f:	c4 42 e5 b8 cd       	vfmadd231pd %ymm13,%ymm3,%ymm9
  400894:	c4 e2 7d 19 58 90    	vbroadcastsd -0x70(%rax),%ymm3
  40089a:	c4 c2 e5 b8 e6       	vfmadd231pd %ymm14,%ymm3,%ymm4
  40089f:	c4 42 e5 b8 c5       	vfmadd231pd %ymm13,%ymm3,%ymm8
  4008a4:	c5 7d 29 f3          	vmovapd %ymm14,%ymm3
  4008a8:	c4 62 7d 19 70 a0    	vbroadcastsd -0x60(%rax),%ymm14
  4008ae:	c4 c2 f5 98 df       	vfmadd132pd %ymm15,%ymm1,%ymm3
  4008b3:	c4 42 ed 98 ef       	vfmadd132pd %ymm15,%ymm2,%ymm13
  4008b8:	c5 fd 28 49 80       	vmovapd -0x80(%rcx),%ymm1
  4008bd:	c5 fd 28 51 a0       	vmovapd -0x60(%rcx),%ymm2
  4008c2:	c4 e2 8d b8 c1       	vfmadd231pd %ymm1,%ymm14,%ymm0
  4008c7:	c4 62 8d b8 e2       	vfmadd231pd %ymm2,%ymm14,%ymm12
  4008cc:	c4 62 7d 19 70 a8    	vbroadcastsd -0x58(%rax),%ymm14
  4008d2:	c4 e2 8d b8 f9       	vfmadd231pd %ymm1,%ymm14,%ymm7
  4008d7:	c4 62 8d b8 da       	vfmadd231pd %ymm2,%ymm14,%ymm11
  4008dc:	c4 62 7d 19 70 b0    	vbroadcastsd -0x50(%rax),%ymm14
  4008e2:	c4 e2 8d b8 f1       	vfmadd231pd %ymm1,%ymm14,%ymm6
  4008e7:	c4 62 8d b8 d2       	vfmadd231pd %ymm2,%ymm14,%ymm10
  4008ec:	c4 62 7d 19 70 b8    	vbroadcastsd -0x48(%rax),%ymm14
  4008f2:	c4 e2 8d b8 e9       	vfmadd231pd %ymm1,%ymm14,%ymm5
  4008f7:	c4 62 8d b8 ca       	vfmadd231pd %ymm2,%ymm14,%ymm9
  4008fc:	c4 62 7d 19 70 c0    	vbroadcastsd -0x40(%rax),%ymm14
  400902:	c4 e2 8d b8 e1       	vfmadd231pd %ymm1,%ymm14,%ymm4
  400907:	c4 62 8d b8 c2       	vfmadd231pd %ymm2,%ymm14,%ymm8
  40090c:	c4 62 7d 19 70 c8    	vbroadcastsd -0x38(%rax),%ymm14
  400912:	c4 e2 8d b8 d9       	vfmadd231pd %ymm1,%ymm14,%ymm3
  400917:	c4 62 8d b8 ea       	vfmadd231pd %ymm2,%ymm14,%ymm13
  40091c:	c5 fd 28 49 c0       	vmovapd -0x40(%rcx),%ymm1
  400921:	c5 fd 28 51 e0       	vmovapd -0x20(%rcx),%ymm2
  400926:	c4 62 7d 19 70 d0    	vbroadcastsd -0x30(%rax),%ymm14
  40092c:	c4 62 8d b8 e2       	vfmadd231pd %ymm2,%ymm14,%ymm12
  400931:	c4 e2 8d b8 c1       	vfmadd231pd %ymm1,%ymm14,%ymm0
  400936:	c4 62 7d 19 70 d8    	vbroadcastsd -0x28(%rax),%ymm14
  40093c:	c4 62 8d b8 da       	vfmadd231pd %ymm2,%ymm14,%ymm11
  400941:	c4 e2 8d b8 f9       	vfmadd231pd %ymm1,%ymm14,%ymm7
  400946:	c4 62 7d 19 70 e0    	vbroadcastsd -0x20(%rax),%ymm14
  40094c:	c4 62 8d b8 d2       	vfmadd231pd %ymm2,%ymm14,%ymm10
  400951:	c4 e2 8d b8 f1       	vfmadd231pd %ymm1,%ymm14,%ymm6
  400956:	c4 62 7d 19 70 e8    	vbroadcastsd -0x18(%rax),%ymm14
  40095c:	c4 62 8d b8 ca       	vfmadd231pd %ymm2,%ymm14,%ymm9
  400961:	c4 e2 8d b8 e9       	vfmadd231pd %ymm1,%ymm14,%ymm5
  400966:	c4 62 7d 19 70 f0    	vbroadcastsd -0x10(%rax),%ymm14
  40096c:	c4 62 8d b8 c2       	vfmadd231pd %ymm2,%ymm14,%ymm8
  400971:	c4 e2 8d b8 e1       	vfmadd231pd %ymm1,%ymm14,%ymm4
  400976:	c4 62 7d 19 70 f8    	vbroadcastsd -0x8(%rax),%ymm14
  40097c:	c4 e2 8d b8 d9       	vfmadd231pd %ymm1,%ymm14,%ymm3
  400981:	c4 c2 95 98 d6       	vfmadd132pd %ymm14,%ymm13,%ymm2
  400986:	48 39 cf             	cmp    %rcx,%rdi
  400989:	0f 85 21 fe ff ff    	jne    4007b0 <main+0x1a0>
  40098f:	c5 1d 58 62 20       	vaddpd 0x20(%rdx),%ymm12,%ymm12
  400994:	c5 fd 58 02          	vaddpd (%rdx),%ymm0,%ymm0
  400998:	48 81 c6 80 01 00 00 	add    $0x180,%rsi
  40099f:	c5 25 58 5a 60       	vaddpd 0x60(%rdx),%ymm11,%ymm11
  4009a4:	c5 c5 58 7a 40       	vaddpd 0x40(%rdx),%ymm7,%ymm7
  4009a9:	c5 2d 58 92 a0 00 00 	vaddpd 0xa0(%rdx),%ymm10,%ymm10
  4009b0:	00 
  4009b1:	c5 cd 58 b2 80 00 00 	vaddpd 0x80(%rdx),%ymm6,%ymm6
  4009b8:	00 
  4009b9:	c5 35 58 8a e0 00 00 	vaddpd 0xe0(%rdx),%ymm9,%ymm9
  4009c0:	00 
  4009c1:	c5 d5 58 aa c0 00 00 	vaddpd 0xc0(%rdx),%ymm5,%ymm5
  4009c8:	00 
  4009c9:	c5 fd 29 02          	vmovapd %ymm0,(%rdx)
  4009cd:	c5 3d 58 82 20 01 00 	vaddpd 0x120(%rdx),%ymm8,%ymm8
  4009d4:	00 
  4009d5:	c5 dd 58 a2 00 01 00 	vaddpd 0x100(%rdx),%ymm4,%ymm4
  4009dc:	00 
  4009dd:	c5 7d 29 62 20       	vmovapd %ymm12,0x20(%rdx)
  4009e2:	c5 ed 58 92 60 01 00 	vaddpd 0x160(%rdx),%ymm2,%ymm2
  4009e9:	00 
  4009ea:	c5 e5 58 8a 40 01 00 	vaddpd 0x140(%rdx),%ymm3,%ymm1
  4009f1:	00 
  4009f2:	c5 fd 29 7a 40       	vmovapd %ymm7,0x40(%rdx)
  4009f7:	c5 7d 29 5a 60       	vmovapd %ymm11,0x60(%rdx)
  4009fc:	c5 fd 29 b2 80 00 00 	vmovapd %ymm6,0x80(%rdx)
  400a03:	00 
  400a04:	c5 7d 29 92 a0 00 00 	vmovapd %ymm10,0xa0(%rdx)
  400a0b:	00 
  400a0c:	c5 fd 29 aa c0 00 00 	vmovapd %ymm5,0xc0(%rdx)
  400a13:	00 
  400a14:	c5 7d 29 8a e0 00 00 	vmovapd %ymm9,0xe0(%rdx)
  400a1b:	00 
  400a1c:	c5 fd 29 a2 00 01 00 	vmovapd %ymm4,0x100(%rdx)
  400a23:	00 
  400a24:	c5 7d 29 82 20 01 00 	vmovapd %ymm8,0x120(%rdx)
  400a2b:	00 
  400a2c:	c5 fd 29 8a 40 01 00 	vmovapd %ymm1,0x140(%rdx)
  400a33:	00 
  400a34:	c5 fd 29 92 60 01 00 	vmovapd %ymm2,0x160(%rdx)
  400a3b:	00 
  400a3c:	48 81 fe 00 18 00 00 	cmp    $0x1800,%rsi
  400a43:	0f 85 17 fd ff ff    	jne    400760 <main+0x150>
  400a49:	0f 31                	rdtsc  
  400a4b:	48 c1 e2 20          	shl    $0x20,%rdx
  400a4f:	89 c0                	mov    %eax,%eax
  400a51:	48 09 c2             	or     %rax,%rdx
  400a54:	4c 29 c2             	sub    %r8,%rdx
  400a57:	49 01 d4             	add    %rdx,%r12
  400a5a:	ff cb                	dec    %ebx
  400a5c:	74 08                	je     400a66 <main+0x456>
  400a5e:	c5 f8 77             	vzeroupper 
  400a61:	e9 da fc ff ff       	jmpq   400740 <main+0x130>
  400a66:	4d 85 e4             	test   %r12,%r12
  400a69:	0f 88 c0 00 00 00    	js     400b2f <main+0x51f>
  400a6f:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
  400a73:	c4 c1 fb 2a c4       	vcvtsi2sd %r12,%xmm0,%xmm0
  400a78:	c5 fb 10 0d 98 06 00 	vmovsd 0x698(%rip),%xmm1        # 401118 <__dso_handle+0xa0>
  400a7f:	00 
  400a80:	bf b4 10 40 00       	mov    $0x4010b4,%edi
  400a85:	b8 01 00 00 00       	mov    $0x1,%eax
  400a8a:	c5 fb 5e 05 7e 06 00 	vdivsd 0x67e(%rip),%xmm0,%xmm0        # 401110 <__dso_handle+0x98>
  400a91:	00 
  400a92:	c5 f3 5e c0          	vdivsd %xmm0,%xmm1,%xmm0
  400a96:	c5 f8 77             	vzeroupper 
  400a99:	e8 32 fb ff ff       	callq  4005d0 <printf@plt>
  400a9e:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
  400aa2:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
  400aa6:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  400aaa:	b9 60 00 00 00       	mov    $0x60,%ecx
  400aaf:	41 b9 00 01 00 00    	mov    $0x100,%r9d
  400ab5:	41 b8 08 00 00 00    	mov    $0x8,%r8d
  400abb:	e8 c0 03 00 00       	callq  400e80 <naive_mm>
  400ac0:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
  400ac4:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
  400ac8:	b9 08 00 00 00       	mov    $0x8,%ecx
  400acd:	ba 60 00 00 00       	mov    $0x60,%edx
  400ad2:	e8 19 03 00 00       	callq  400df0 <check>
  400ad7:	84 c0                	test   %al,%al
  400ad9:	75 48                	jne    400b23 <main+0x513>
  400adb:	bf ba 10 40 00       	mov    $0x4010ba,%edi
  400ae0:	e8 db fa ff ff       	callq  4005c0 <puts@plt>
  400ae5:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  400ae9:	e8 c2 fa ff ff       	callq  4005b0 <free@plt>
  400aee:	48 8b 7d b0          	mov    -0x50(%rbp),%rdi
  400af2:	e8 b9 fa ff ff       	callq  4005b0 <free@plt>
  400af7:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  400afb:	e8 b0 fa ff ff       	callq  4005b0 <free@plt>
  400b00:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  400b04:	e8 a7 fa ff ff       	callq  4005b0 <free@plt>
  400b09:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
  400b0d:	e8 9e fa ff ff       	callq  4005b0 <free@plt>
  400b12:	48 83 c4 58          	add    $0x58,%rsp
  400b16:	31 c0                	xor    %eax,%eax
  400b18:	5b                   	pop    %rbx
  400b19:	41 5a                	pop    %r10
  400b1b:	41 5c                	pop    %r12
  400b1d:	5d                   	pop    %rbp
  400b1e:	49 8d 62 f8          	lea    -0x8(%r10),%rsp
  400b22:	c3                   	retq   
  400b23:	bf d7 10 40 00       	mov    $0x4010d7,%edi
  400b28:	e8 93 fa ff ff       	callq  4005c0 <puts@plt>
  400b2d:	eb b6                	jmp    400ae5 <main+0x4d5>
  400b2f:	4c 89 e0             	mov    %r12,%rax
  400b32:	41 83 e4 01          	and    $0x1,%r12d
  400b36:	c5 f9 57 c0          	vxorpd %xmm0,%xmm0,%xmm0
  400b3a:	48 d1 e8             	shr    %rax
  400b3d:	4c 09 e0             	or     %r12,%rax
  400b40:	c4 e1 fb 2a c0       	vcvtsi2sd %rax,%xmm0,%xmm0
  400b45:	c5 fb 58 c0          	vaddsd %xmm0,%xmm0,%xmm0
  400b49:	e9 2a ff ff ff       	jmpq   400a78 <main+0x468>

0000000000400b4e <.annobin_elf_init.c.hot>:
  400b4e:	66 90                	xchg   %ax,%ax

0000000000400b50 <_start>:
  400b50:	f3 0f 1e fa          	endbr64 
  400b54:	31 ed                	xor    %ebp,%ebp
  400b56:	49 89 d1             	mov    %rdx,%r9
  400b59:	5e                   	pop    %rsi
  400b5a:	48 89 e2             	mov    %rsp,%rdx
  400b5d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400b61:	50                   	push   %rax
  400b62:	54                   	push   %rsp
  400b63:	49 c7 c0 50 10 40 00 	mov    $0x401050,%r8
  400b6a:	48 c7 c1 e0 0f 40 00 	mov    $0x400fe0,%rcx
  400b71:	48 c7 c7 10 06 40 00 	mov    $0x400610,%rdi
  400b78:	ff 15 6a 14 20 00    	callq  *0x20146a(%rip)        # 601fe8 <__libc_start_main@GLIBC_2.2.5>
  400b7e:	f4                   	hlt    

0000000000400b7f <.annobin_init.c>:
  400b7f:	90                   	nop

0000000000400b80 <_dl_relocate_static_pie>:
  400b80:	f3 0f 1e fa          	endbr64 
  400b84:	c3                   	retq   

0000000000400b85 <.annobin__dl_relocate_static_pie.end>:
  400b85:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400b8c:	00 00 00 
  400b8f:	90                   	nop

0000000000400b90 <deregister_tm_clones>:
  400b90:	48 8d 3d b9 14 20 00 	lea    0x2014b9(%rip),%rdi        # 602050 <__TMC_END__>
  400b97:	48 8d 05 b2 14 20 00 	lea    0x2014b2(%rip),%rax        # 602050 <__TMC_END__>
  400b9e:	48 39 f8             	cmp    %rdi,%rax
  400ba1:	74 15                	je     400bb8 <deregister_tm_clones+0x28>
  400ba3:	48 8b 05 36 14 20 00 	mov    0x201436(%rip),%rax        # 601fe0 <_ITM_deregisterTMCloneTable@Base>
  400baa:	48 85 c0             	test   %rax,%rax
  400bad:	74 09                	je     400bb8 <deregister_tm_clones+0x28>
  400baf:	ff e0                	jmpq   *%rax
  400bb1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400bb8:	c3                   	retq   
  400bb9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400bc0 <register_tm_clones>:
  400bc0:	48 8d 3d 89 14 20 00 	lea    0x201489(%rip),%rdi        # 602050 <__TMC_END__>
  400bc7:	48 8d 35 82 14 20 00 	lea    0x201482(%rip),%rsi        # 602050 <__TMC_END__>
  400bce:	48 29 fe             	sub    %rdi,%rsi
  400bd1:	48 c1 fe 03          	sar    $0x3,%rsi
  400bd5:	48 89 f0             	mov    %rsi,%rax
  400bd8:	48 c1 e8 3f          	shr    $0x3f,%rax
  400bdc:	48 01 c6             	add    %rax,%rsi
  400bdf:	48 d1 fe             	sar    %rsi
  400be2:	74 14                	je     400bf8 <register_tm_clones+0x38>
  400be4:	48 8b 05 0d 14 20 00 	mov    0x20140d(%rip),%rax        # 601ff8 <_ITM_registerTMCloneTable@Base>
  400beb:	48 85 c0             	test   %rax,%rax
  400bee:	74 08                	je     400bf8 <register_tm_clones+0x38>
  400bf0:	ff e0                	jmpq   *%rax
  400bf2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  400bf8:	c3                   	retq   
  400bf9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400c00 <__do_global_dtors_aux>:
  400c00:	f3 0f 1e fa          	endbr64 
  400c04:	80 3d 41 14 20 00 00 	cmpb   $0x0,0x201441(%rip)        # 60204c <_edata>
  400c0b:	75 13                	jne    400c20 <__do_global_dtors_aux+0x20>
  400c0d:	55                   	push   %rbp
  400c0e:	48 89 e5             	mov    %rsp,%rbp
  400c11:	e8 7a ff ff ff       	callq  400b90 <deregister_tm_clones>
  400c16:	c6 05 2f 14 20 00 01 	movb   $0x1,0x20142f(%rip)        # 60204c <_edata>
  400c1d:	5d                   	pop    %rbp
  400c1e:	c3                   	retq   
  400c1f:	90                   	nop
  400c20:	c3                   	retq   
  400c21:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  400c28:	00 00 00 00 
  400c2c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400c30 <frame_dummy>:
  400c30:	f3 0f 1e fa          	endbr64 
  400c34:	eb 8a                	jmp    400bc0 <register_tm_clones>
  400c36:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400c3d:	00 00 00 

0000000000400c40 <pack>:
  400c40:	89 d0                	mov    %edx,%eax
  400c42:	55                   	push   %rbp
  400c43:	99                   	cltd   
  400c44:	f7 f9                	idiv   %ecx
  400c46:	48 89 e5             	mov    %rsp,%rbp
  400c49:	41 57                	push   %r15
  400c4b:	41 56                	push   %r14
  400c4d:	41 55                	push   %r13
  400c4f:	41 54                	push   %r12
  400c51:	53                   	push   %rbx
  400c52:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
  400c56:	48 89 74 24 e0       	mov    %rsi,-0x20(%rsp)
  400c5b:	89 44 24 f8          	mov    %eax,-0x8(%rsp)
  400c5f:	85 c0                	test   %eax,%eax
  400c61:	0f 84 74 01 00 00    	je     400ddb <pack+0x19b>
  400c67:	45 85 c0             	test   %r8d,%r8d
  400c6a:	0f 84 6b 01 00 00    	je     400ddb <pack+0x19b>
  400c70:	43 8d 04 00          	lea    (%r8,%r8,1),%eax
  400c74:	49 63 d8             	movslq %r8d,%rbx
  400c77:	48 c7 44 24 e8 00 00 	movq   $0x0,-0x18(%rsp)
  400c7e:	00 00 
  400c80:	4c 63 f8             	movslq %eax,%r15
  400c83:	44 01 c0             	add    %r8d,%eax
  400c86:	c7 44 24 fc 00 00 00 	movl   $0x0,-0x4(%rsp)
  400c8d:	00 
  400c8e:	4c 63 e8             	movslq %eax,%r13
  400c91:	41 0f af c8          	imul   %r8d,%ecx
  400c95:	42 8d 04 85 00 00 00 	lea    0x0(,%r8,4),%eax
  400c9c:	00 
  400c9d:	4c 63 f0             	movslq %eax,%r14
  400ca0:	44 01 c0             	add    %r8d,%eax
  400ca3:	48 98                	cltq   
  400ca5:	48 89 44 24 f0       	mov    %rax,-0x10(%rsp)
  400caa:	41 8d 40 fc          	lea    -0x4(%r8),%eax
  400cae:	4c 63 e1             	movslq %ecx,%r12
  400cb1:	49 89 c0             	mov    %rax,%r8
  400cb4:	48 89 44 24 d8       	mov    %rax,-0x28(%rsp)
  400cb9:	41 c1 e8 02          	shr    $0x2,%r8d
  400cbd:	44 89 c0             	mov    %r8d,%eax
  400cc0:	48 8d 44 40 03       	lea    0x3(%rax,%rax,2),%rax
  400cc5:	48 c1 e0 06          	shl    $0x6,%rax
  400cc9:	48 89 44 24 d0       	mov    %rax,-0x30(%rsp)
  400cce:	48 8d 46 20          	lea    0x20(%rsi),%rax
  400cd2:	48 89 44 24 c8       	mov    %rax,-0x38(%rsp)
  400cd7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400cde:	00 00 
  400ce0:	48 8b 4c 24 d8       	mov    -0x28(%rsp),%rcx
  400ce5:	48 8b 74 24 c8       	mov    -0x38(%rsp),%rsi
  400cea:	4d 89 f9             	mov    %r15,%r9
  400ced:	4d 89 e8             	mov    %r13,%r8
  400cf0:	48 8b 44 24 e0       	mov    -0x20(%rsp),%rax
  400cf5:	4c 8b 54 24 e8       	mov    -0x18(%rsp),%r10
  400cfa:	49 29 d9             	sub    %rbx,%r9
  400cfd:	49 29 d8             	sub    %rbx,%r8
  400d00:	48 8d 14 0b          	lea    (%rbx,%rcx,1),%rdx
  400d04:	48 8b 4c 24 f0       	mov    -0x10(%rsp),%rcx
  400d09:	4c 8d 1c d6          	lea    (%rsi,%rdx,8),%r11
  400d0d:	4c 89 f6             	mov    %r14,%rsi
  400d10:	48 8d 04 d8          	lea    (%rax,%rbx,8),%rax
  400d14:	48 89 fa             	mov    %rdi,%rdx
  400d17:	49 29 da             	sub    %rbx,%r10
  400d1a:	48 29 de             	sub    %rbx,%rsi
  400d1d:	48 29 d9             	sub    %rbx,%rcx
  400d20:	c4 a1 7d 10 34 d0    	vmovupd (%rax,%r10,8),%ymm6
  400d26:	c4 a1 7d 10 0c c8    	vmovupd (%rax,%r9,8),%ymm1
  400d2c:	48 81 c2 c0 00 00 00 	add    $0xc0,%rdx
  400d33:	c5 cd 14 20          	vunpcklpd (%rax),%ymm6,%ymm4
  400d37:	c5 cd 15 10          	vunpckhpd (%rax),%ymm6,%ymm2
  400d3b:	c4 a1 75 14 2c c0    	vunpcklpd (%rax,%r8,8),%ymm1,%ymm5
  400d41:	c4 a1 75 15 04 c0    	vunpckhpd (%rax,%r8,8),%ymm1,%ymm0
  400d47:	c5 fd 10 34 f0       	vmovupd (%rax,%rsi,8),%ymm6
  400d4c:	c5 cd 14 1c c8       	vunpcklpd (%rax,%rcx,8),%ymm6,%ymm3
  400d51:	c5 cd 15 0c c8       	vunpckhpd (%rax,%rcx,8),%ymm6,%ymm1
  400d56:	c4 63 5d 18 c5 01    	vinsertf128 $0x1,%xmm5,%ymm4,%ymm8
  400d5c:	48 83 c0 20          	add    $0x20,%rax
  400d60:	c4 e3 65 18 fa 01    	vinsertf128 $0x1,%xmm2,%ymm3,%ymm7
  400d66:	c4 e3 5d 06 e5 31    	vperm2f128 $0x31,%ymm5,%ymm4,%ymm4
  400d6c:	c4 e3 65 06 d2 31    	vperm2f128 $0x31,%ymm2,%ymm3,%ymm2
  400d72:	c5 7d 11 82 40 ff ff 	vmovupd %ymm8,-0xc0(%rdx)
  400d79:	ff 
  400d7a:	c4 e3 7d 18 f1 01    	vinsertf128 $0x1,%xmm1,%ymm0,%ymm6
  400d80:	c4 e3 7d 06 c1 31    	vperm2f128 $0x31,%ymm1,%ymm0,%ymm0
  400d86:	c5 fd 11 62 a0       	vmovupd %ymm4,-0x60(%rdx)
  400d8b:	c5 fd 11 ba 60 ff ff 	vmovupd %ymm7,-0xa0(%rdx)
  400d92:	ff 
  400d93:	c5 fd 11 72 80       	vmovupd %ymm6,-0x80(%rdx)
  400d98:	c5 fd 11 52 c0       	vmovupd %ymm2,-0x40(%rdx)
  400d9d:	c5 fd 11 42 e0       	vmovupd %ymm0,-0x20(%rdx)
  400da2:	4c 39 d8             	cmp    %r11,%rax
  400da5:	0f 85 75 ff ff ff    	jne    400d20 <pack+0xe0>
  400dab:	ff 44 24 fc          	incl   -0x4(%rsp)
  400daf:	48 03 7c 24 d0       	add    -0x30(%rsp),%rdi
  400db4:	4c 01 e3             	add    %r12,%rbx
  400db7:	4d 01 e7             	add    %r12,%r15
  400dba:	8b 44 24 fc          	mov    -0x4(%rsp),%eax
  400dbe:	4c 01 64 24 e8       	add    %r12,-0x18(%rsp)
  400dc3:	4d 01 e5             	add    %r12,%r13
  400dc6:	4d 01 e6             	add    %r12,%r14
  400dc9:	4c 01 64 24 f0       	add    %r12,-0x10(%rsp)
  400dce:	3b 44 24 f8          	cmp    -0x8(%rsp),%eax
  400dd2:	0f 85 08 ff ff ff    	jne    400ce0 <pack+0xa0>
  400dd8:	c5 f8 77             	vzeroupper 
  400ddb:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  400ddf:	5b                   	pop    %rbx
  400de0:	41 5c                	pop    %r12
  400de2:	41 5d                	pop    %r13
  400de4:	41 5e                	pop    %r14
  400de6:	41 5f                	pop    %r15
  400de8:	5d                   	pop    %rbp
  400de9:	c3                   	retq   
  400dea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400df0 <check>:
  400df0:	0f af d1             	imul   %ecx,%edx
  400df3:	85 d2                	test   %edx,%edx
  400df5:	74 5b                	je     400e52 <check+0x62>
  400df7:	c5 fb 10 07          	vmovsd (%rdi),%xmm0
  400dfb:	c5 fb 10 0e          	vmovsd (%rsi),%xmm1
  400dff:	c5 fa 7e 1d e9 02 00 	vmovq  0x2e9(%rip),%xmm3        # 4010f0 <__dso_handle+0x78>
  400e06:	00 
  400e07:	c5 fb 10 25 f1 02 00 	vmovsd 0x2f1(%rip),%xmm4        # 401100 <__dso_handle+0x88>
  400e0e:	00 
  400e0f:	c5 fb 5c d1          	vsubsd %xmm1,%xmm0,%xmm2
  400e13:	c5 e9 54 d3          	vandpd %xmm3,%xmm2,%xmm2
  400e17:	c5 f9 2f d4          	vcomisd %xmm4,%xmm2
  400e1b:	77 3b                	ja     400e58 <check+0x68>
  400e1d:	ff ca                	dec    %edx
  400e1f:	b8 01 00 00 00       	mov    $0x1,%eax
  400e24:	48 ff c2             	inc    %rdx
  400e27:	eb 22                	jmp    400e4b <check+0x5b>
  400e29:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400e30:	c5 fb 10 04 c7       	vmovsd (%rdi,%rax,8),%xmm0
  400e35:	c5 fb 10 0c c6       	vmovsd (%rsi,%rax,8),%xmm1
  400e3a:	48 ff c0             	inc    %rax
  400e3d:	c5 fb 5c d1          	vsubsd %xmm1,%xmm0,%xmm2
  400e41:	c5 e9 54 d3          	vandpd %xmm3,%xmm2,%xmm2
  400e45:	c5 f9 2f d4          	vcomisd %xmm4,%xmm2
  400e49:	77 0f                	ja     400e5a <check+0x6a>
  400e4b:	89 c1                	mov    %eax,%ecx
  400e4d:	48 39 d0             	cmp    %rdx,%rax
  400e50:	75 de                	jne    400e30 <check+0x40>
  400e52:	b8 01 00 00 00       	mov    $0x1,%eax
  400e57:	c3                   	retq   
  400e58:	31 c9                	xor    %ecx,%ecx
  400e5a:	48 83 ec 08          	sub    $0x8,%rsp
  400e5e:	89 ce                	mov    %ecx,%esi
  400e60:	bf 80 10 40 00       	mov    $0x401080,%edi
  400e65:	b8 02 00 00 00       	mov    $0x2,%eax
  400e6a:	e8 61 f7 ff ff       	callq  4005d0 <printf@plt>
  400e6f:	31 c0                	xor    %eax,%eax
  400e71:	48 83 c4 08          	add    $0x8,%rsp
  400e75:	c3                   	retq   
  400e76:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400e7d:	00 00 00 

0000000000400e80 <naive_mm>:
  400e80:	41 57                	push   %r15
  400e82:	41 56                	push   %r14
  400e84:	41 55                	push   %r13
  400e86:	41 54                	push   %r12
  400e88:	55                   	push   %rbp
  400e89:	53                   	push   %rbx
  400e8a:	48 89 54 24 e8       	mov    %rdx,-0x18(%rsp)
  400e8f:	89 4c 24 f4          	mov    %ecx,-0xc(%rsp)
  400e93:	85 c9                	test   %ecx,%ecx
  400e95:	0f 84 27 01 00 00    	je     400fc2 <naive_mm+0x142>
  400e9b:	45 85 c0             	test   %r8d,%r8d
  400e9e:	0f 84 1e 01 00 00    	je     400fc2 <naive_mm+0x142>
  400ea4:	44 89 c8             	mov    %r9d,%eax
  400ea7:	49 63 d8             	movslq %r8d,%rbx
  400eaa:	45 89 cd             	mov    %r9d,%r13d
  400ead:	45 89 cc             	mov    %r9d,%r12d
  400eb0:	d1 e8                	shr    %eax
  400eb2:	c7 44 24 f0 00 00 00 	movl   $0x0,-0x10(%rsp)
  400eb9:	00 
  400eba:	48 89 dd             	mov    %rbx,%rbp
  400ebd:	45 31 d2             	xor    %r10d,%r10d
  400ec0:	48 c1 e0 04          	shl    $0x4,%rax
  400ec4:	c7 44 24 dc 00 00 00 	movl   $0x0,-0x24(%rsp)
  400ecb:	00 
  400ecc:	48 c1 e5 04          	shl    $0x4,%rbp
  400ed0:	41 83 e5 fe          	and    $0xfffffffe,%r13d
  400ed4:	48 89 44 24 e0       	mov    %rax,-0x20(%rsp)
  400ed9:	41 8d 40 ff          	lea    -0x1(%r8),%eax
  400edd:	48 c1 e3 03          	shl    $0x3,%rbx
  400ee1:	48 89 44 24 d0       	mov    %rax,-0x30(%rsp)
  400ee6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400eed:	00 00 00 
  400ef0:	49 63 c2             	movslq %r10d,%rax
  400ef3:	48 8b 4c 24 e8       	mov    -0x18(%rsp),%rcx
  400ef8:	45 31 c9             	xor    %r9d,%r9d
  400efb:	4c 8d 3c c7          	lea    (%rdi,%rax,8),%r15
  400eff:	48 8b 44 24 e0       	mov    -0x20(%rsp),%rax
  400f04:	4d 8d 1c 07          	lea    (%r15,%rax,1),%r11
  400f08:	48 63 44 24 f0       	movslq -0x10(%rsp),%rax
  400f0d:	4c 8d 34 c1          	lea    (%rcx,%rax,8),%r14
  400f11:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400f18:	44 89 c9             	mov    %r9d,%ecx
  400f1b:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
  400f1f:	45 85 e4             	test   %r12d,%r12d
  400f22:	74 68                	je     400f8c <naive_mm+0x10c>
  400f24:	41 83 fc 01          	cmp    $0x1,%r12d
  400f28:	0f 84 9f 00 00 00    	je     400fcd <naive_mm+0x14d>
  400f2e:	4a 8d 14 ce          	lea    (%rsi,%r9,8),%rdx
  400f32:	4c 89 f8             	mov    %r15,%rax
  400f35:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
  400f39:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400f40:	c5 fb 10 02          	vmovsd (%rdx),%xmm0
  400f44:	48 83 c0 10          	add    $0x10,%rax
  400f48:	c5 f9 16 04 1a       	vmovhpd (%rdx,%rbx,1),%xmm0,%xmm0
  400f4d:	48 01 ea             	add    %rbp,%rdx
  400f50:	c5 f9 59 40 f0       	vmulpd -0x10(%rax),%xmm0,%xmm0
  400f55:	c5 f3 58 c8          	vaddsd %xmm0,%xmm1,%xmm1
  400f59:	c5 f9 15 c0          	vunpckhpd %xmm0,%xmm0,%xmm0
  400f5d:	c5 fb 58 c9          	vaddsd %xmm1,%xmm0,%xmm1
  400f61:	4c 39 d8             	cmp    %r11,%rax
  400f64:	75 da                	jne    400f40 <naive_mm+0xc0>
  400f66:	44 89 e8             	mov    %r13d,%eax
  400f69:	45 39 e5             	cmp    %r12d,%r13d
  400f6c:	74 1e                	je     400f8c <naive_mm+0x10c>
  400f6e:	44 89 c2             	mov    %r8d,%edx
  400f71:	0f af d0             	imul   %eax,%edx
  400f74:	44 01 d0             	add    %r10d,%eax
  400f77:	48 98                	cltq   
  400f79:	01 ca                	add    %ecx,%edx
  400f7b:	48 63 d2             	movslq %edx,%rdx
  400f7e:	c5 fb 10 04 d6       	vmovsd (%rsi,%rdx,8),%xmm0
  400f83:	c5 fb 59 04 c7       	vmulsd (%rdi,%rax,8),%xmm0,%xmm0
  400f88:	c5 f3 58 c8          	vaddsd %xmm0,%xmm1,%xmm1
  400f8c:	c4 81 7b 11 0c ce    	vmovsd %xmm1,(%r14,%r9,8)
  400f92:	49 8d 41 01          	lea    0x1(%r9),%rax
  400f96:	4c 39 4c 24 d0       	cmp    %r9,-0x30(%rsp)
  400f9b:	74 0b                	je     400fa8 <naive_mm+0x128>
  400f9d:	49 89 c1             	mov    %rax,%r9
  400fa0:	e9 73 ff ff ff       	jmpq   400f18 <naive_mm+0x98>
  400fa5:	0f 1f 00             	nopl   (%rax)
  400fa8:	ff 44 24 dc          	incl   -0x24(%rsp)
  400fac:	45 01 e2             	add    %r12d,%r10d
  400faf:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  400fb3:	44 01 44 24 f0       	add    %r8d,-0x10(%rsp)
  400fb8:	39 44 24 f4          	cmp    %eax,-0xc(%rsp)
  400fbc:	0f 85 2e ff ff ff    	jne    400ef0 <naive_mm+0x70>
  400fc2:	5b                   	pop    %rbx
  400fc3:	5d                   	pop    %rbp
  400fc4:	41 5c                	pop    %r12
  400fc6:	41 5d                	pop    %r13
  400fc8:	41 5e                	pop    %r14
  400fca:	41 5f                	pop    %r15
  400fcc:	c3                   	retq   
  400fcd:	31 c0                	xor    %eax,%eax
  400fcf:	c5 f1 57 c9          	vxorpd %xmm1,%xmm1,%xmm1
  400fd3:	eb 99                	jmp    400f6e <naive_mm+0xee>
  400fd5:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400fdc:	00 00 00 
  400fdf:	90                   	nop

0000000000400fe0 <__libc_csu_init>:
  400fe0:	f3 0f 1e fa          	endbr64 
  400fe4:	41 57                	push   %r15
  400fe6:	49 89 d7             	mov    %rdx,%r15
  400fe9:	41 56                	push   %r14
  400feb:	49 89 f6             	mov    %rsi,%r14
  400fee:	41 55                	push   %r13
  400ff0:	41 89 fd             	mov    %edi,%r13d
  400ff3:	41 54                	push   %r12
  400ff5:	4c 8d 25 04 0e 20 00 	lea    0x200e04(%rip),%r12        # 601e00 <__frame_dummy_init_array_entry>
  400ffc:	55                   	push   %rbp
  400ffd:	48 8d 2d 04 0e 20 00 	lea    0x200e04(%rip),%rbp        # 601e08 <__init_array_end>
  401004:	53                   	push   %rbx
  401005:	4c 29 e5             	sub    %r12,%rbp
  401008:	48 83 ec 08          	sub    $0x8,%rsp
  40100c:	e8 6f f5 ff ff       	callq  400580 <_init>
  401011:	48 c1 fd 03          	sar    $0x3,%rbp
  401015:	74 1f                	je     401036 <__libc_csu_init+0x56>
  401017:	31 db                	xor    %ebx,%ebx
  401019:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401020:	4c 89 fa             	mov    %r15,%rdx
  401023:	4c 89 f6             	mov    %r14,%rsi
  401026:	44 89 ef             	mov    %r13d,%edi
  401029:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40102d:	48 83 c3 01          	add    $0x1,%rbx
  401031:	48 39 dd             	cmp    %rbx,%rbp
  401034:	75 ea                	jne    401020 <__libc_csu_init+0x40>
  401036:	48 83 c4 08          	add    $0x8,%rsp
  40103a:	5b                   	pop    %rbx
  40103b:	5d                   	pop    %rbp
  40103c:	41 5c                	pop    %r12
  40103e:	41 5d                	pop    %r13
  401040:	41 5e                	pop    %r14
  401042:	41 5f                	pop    %r15
  401044:	c3                   	retq   

0000000000401045 <.annobin___libc_csu_fini.start>:
  401045:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
  40104c:	00 00 00 00 

0000000000401050 <__libc_csu_fini>:
  401050:	f3 0f 1e fa          	endbr64 
  401054:	c3                   	retq   

Disassembly of section .fini:

0000000000401058 <_fini>:
  401058:	f3 0f 1e fa          	endbr64 
  40105c:	48 83 ec 08          	sub    $0x8,%rsp
  401060:	48 83 c4 08          	add    $0x8,%rsp
  401064:	c3                   	retq   

.section .text
.global compare_128

compare_128:

    # Restar partes bajas 
    subs x0, x0, x2
    
    # Restar partes altas con carry
    sbcs x1, x1, x3
    
    # b.eq  → a == b
    # b.lt  → a < b
    # b.gt  → a > b
    # b.ne  → a != b
    
    ret
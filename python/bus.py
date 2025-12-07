import math

def jumlahBus(penumpang, kapasitas):
    
    return math.ceil(penumpang / kapasitas)


print("Testing Program Jumlah Bus Telkom University")
print("=" * 50)

# Test case 1
n1, m1 = 10, 25
hasil1 = jumlahBus(n1, m1)
print(f"Test 1: {n1} mahasiswa, kapasitas {m1}")
print(f"Hasil: {hasil1} bus\n")

# Test case 2
n2, m2 = 20, 15
hasil2 = jumlahBus(n2, m2)
print(f"Test 2: {n2} mahasiswa, kapasitas {m2}")
print(f"Hasil: {hasil2} bus\n")

# Test case 3
n3, m3 = 120, 30
hasil3 = jumlahBus(n3, m3)
print(f"Test 3: {n3} mahasiswa, kapasitas {m3}")
print(f"Hasil: {hasil3} bus\n")

# Interactive input
print("=" * 50)
print("Coba masukkan data sendiri:")
try:
    penumpang = int(input("Jumlah mahasiswa: "))
    kapasitas = int(input("Kapasitas bus: "))
    hasil = jumlahBus(penumpang, kapasitas)
    print(f"\nJumlah bus yang diperlukan: {hasil} bus")
except ValueError:
    print("Input harus berupa bilangan bulat!")
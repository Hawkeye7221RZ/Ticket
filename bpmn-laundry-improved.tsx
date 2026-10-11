import React from 'react';

const ImprovedBPMN = () => {
  return (
    <div className="w-full h-screen bg-gray-50 p-8 overflow-auto">
      <div className="max-w-7xl mx-auto">
        <h1 className="text-3xl font-bold text-center mb-2 text-gray-800">
          Rekomendasi TO-BE: Proses Laundry (Improved)
        </h1>
        <p className="text-center text-gray-600 mb-8">
          BPMN 2.0 - Business Process Model and Notation
        </p>

        {/* Legend */}
        <div className="bg-white p-4 rounded-lg shadow mb-6">
          <h3 className="font-bold text-lg mb-3">Legend:</h3>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4 text-sm">
            <div className="flex items-center gap-2">
              <div className="w-6 h-6 rounded-full border-2 border-green-600"></div>
              <span>Start Event</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-6 h-6 rounded-full border-4 border-red-600"></div>
              <span>End Event</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-6 h-6 border-2 border-blue-600 rotate-45"></div>
              <span>Gateway (Decision)</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-8 h-1 bg-gray-400"></div>
              <span>Sequence Flow</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-8 h-0.5 border-t-2 border-dashed border-purple-500"></div>
              <span>Message Flow</span>
            </div>
          </div>
        </div>

        {/* BPMN Diagram */}
        <div className="bg-white rounded-lg shadow-lg p-6">
          <svg viewBox="0 0 1400 800" className="w-full">
            {/* Pool 1: Customer */}
            <g>
              <rect x="10" y="10" width="1380" height="120" fill="#E3F2FD" stroke="#1976D2" strokeWidth="2" rx="5"/>
              <text x="20" y="70" fontSize="16" fontWeight="bold" fill="#1565C0">CUSTOMER</text>
              
              {/* Start Event */}
              <circle cx="120" cy="70" r="15" fill="white" stroke="#4CAF50" strokeWidth="2"/>
              <text x="90" y="105" fontSize="11" fill="#333">Datang ke Laundry</text>
              
              {/* Task 1 */}
              <rect x="180" y="45" width="120" height="50" fill="white" stroke="#1976D2" strokeWidth="2" rx="5"/>
              <text x="205" y="75" fontSize="12" fill="#333">Serahkan</text>
              <text x="210" y="90" fontSize="12" fill="#333">Cucian</text>
              
              {/* Arrow */}
              <path d="M 135 70 L 180 70" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              <path d="M 300 70 L 340 70" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              
              {/* Gateway - Metode Pembayaran */}
              <g transform="translate(360, 70)">
                <rect x="-20" y="-20" width="40" height="40" fill="white" stroke="#FF9800" strokeWidth="2" transform="rotate(45)" rx="3"/>
                <text x="-10" y="5" fontSize="14" fontWeight="bold">×</text>
              </g>
              <text x="330" y="105" fontSize="10" fill="#333">Pilih Metode</text>
              
              {/* Path - Bayar Sekarang */}
              <path d="M 380 70 L 440 70" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              <text x="385" y="65" fontSize="10" fill="#FF5722">Bayar Sekarang</text>
              
              <rect x="440" y="45" width="100" height="50" fill="white" stroke="#1976D2" strokeWidth="2" rx="5"/>
              <text x="470" y="75" fontSize="12" fill="#333">Bayar</text>
              
              {/* Path - Bayar Nanti */}
              <path d="M 360 90 L 360 110 L 620 110 L 620 70" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              <text x="365" y="105" fontSize="10" fill="#FF5722">Bayar Nanti</text>
              
              {/* Merge Gateway */}
              <g transform="translate(640, 70)">
                <rect x="-20" y="-20" width="40" height="40" fill="white" stroke="#FF9800" strokeWidth="2" transform="rotate(45)" rx="3"/>
                <text x="-8" y="5" fontSize="14" fontWeight="bold">+</text>
              </g>
              
              {/* Task - Terima Nota */}
              <rect x="690" y="45" width="120" height="50" fill="white" stroke="#1976D2" strokeWidth="2" rx="5"/>
              <text x="720" y="75" fontSize="12" fill="#333">Terima Nota</text>
              <text x="730" y="90" fontSize="12" fill="#333">& Resi</text>
              
              <path d="M 540 70 L 620 70" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              <path d="M 660 70 L 690 70" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              
              {/* Task - Tunggu */}
              <rect x="850" y="45" width="100" height="50" fill="white" stroke="#1976D2" strokeWidth="2" rx="5"/>
              <text x="885" y="75" fontSize="12" fill="#333">Tunggu</text>
              
              <path d="M 810 70 L 850 70" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              
              {/* Gateway - Ambil/Delivery */}
              <g transform="translate(1000, 70)">
                <rect x="-20" y="-20" width="40" height="40" fill="white" stroke="#FF9800" strokeWidth="2" transform="rotate(45)" rx="3"/>
                <text x="-10" y="5" fontSize="14" fontWeight="bold">×</text>
              </g>
              <text x="985" y="105" fontSize="10" fill="#333">Ambil/Antar</text>
              
              <path d="M 950 70 L 980 70" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              
              {/* Path - Ambil Sendiri */}
              <path d="M 1020 70 L 1080 70" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              <text x="1025" y="65" fontSize="10" fill="#FF5722">Ambil Sendiri</text>
              
              <rect x="1080" y="45" width="100" height="50" fill="white" stroke="#1976D2" strokeWidth="2" rx="5"/>
              <text x="1105" y="70" fontSize="12" fill="#333">Ambil di</text>
              <text x="1110" y="85" fontSize="12" fill="#333">Toko</text>
              
              {/* Path - Delivery */}
              <path d="M 1000 90 L 1000 110 L 1230 110 L 1230 70" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              <text x="1090" y="125" fontSize="10" fill="#FF5722">Minta Antar</text>
              
              <rect x="1230" y="45" width="100" height="50" fill="white" stroke="#1976D2" strokeWidth="2" rx="5"/>
              <text x="1260" y="70" fontSize="12" fill="#333">Terima</text>
              <text x="1255" y="85" fontSize="12" fill="#333">Cucian</text>
              
              {/* End Event */}
              <circle cx="1360" cy="70" r="15" fill="white" stroke="#F44336" strokeWidth="4"/>
              <text x="1345" y="105" fontSize="11" fill="#333">Selesai</text>
              
              <path d="M 1180 70 L 1230 70" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              <path d="M 1330 70 L 1345 70" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
            </g>

            {/* Pool 2: Admin/Staff */}
            <g>
              <rect x="10" y="150" width="1380" height="200" fill="#FFF3E0" stroke="#F57C00" strokeWidth="2" rx="5"/>
              <text x="20" y="250" fontSize="16" fontWeight="bold" fill="#E65100">ADMIN / STAFF</text>
              
              {/* Message flow dari customer */}
              <path d="M 240 95 L 240 175" stroke="#9C27B0" strokeWidth="2" strokeDasharray="5,5" fill="none" markerEnd="url(#arrowhead-message)"/>
              
              {/* Task - Terima Cucian */}
              <rect x="180" y="175" width="120" height="50" fill="white" stroke="#F57C00" strokeWidth="2" rx="5"/>
              <text x="205" y="200" fontSize="12" fill="#333">Terima & Cek</text>
              <text x="215" y="215" fontSize="12" fill="#333">Cucian</text>
              
              {/* Task - Timbang */}
              <rect x="330" y="175" width="100" height="50" fill="white" stroke="#F57C00" strokeWidth="2" rx="5"/>
              <text x="360" y="200" fontSize="12" fill="#333">Timbang</text>
              <text x="350" y="215" fontSize="12" fill="#333">& Hitung</text>
              
              <path d="M 300 200 L 330 200" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              
              {/* Task - Buat Nota */}
              <rect x="460" y="175" width="100" height="50" fill="white" stroke="#F57C00" strokeWidth="2" rx="5"/>
              <text x="485" y="200" fontSize="12" fill="#333">Buat Nota</text>
              <text x="490" y="215" fontSize="12" fill="#333">& Resi</text>
              
              <path d="M 430 200 L 460 200" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              
              {/* Gateway - Sudah Bayar? */}
              <g transform="translate(610, 200)">
                <rect x="-20" y="-20" width="40" height="40" fill="white" stroke="#FF9800" strokeWidth="2" transform="rotate(45)" rx="3"/>
                <text x="-6" y="5" fontSize="14" fontWeight="bold">?</text>
              </g>
              <text x="575" y="240" fontSize="10" fill="#333">Sudah Bayar?</text>
              
              <path d="M 560 200 L 590 200" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              
              {/* Path - Ya (Sudah Bayar) */}
              <path d="M 630 200 L 690 200" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              <text x="640" y="195" fontSize="10" fill="#4CAF50">Ya</text>
              
              <rect x="690" y="175" width="120" height="50" fill="white" stroke="#F57C00" strokeWidth="2" rx="5"/>
              <text x="715" y="195" fontSize="12" fill="#333">Catat</text>
              <text x="705" y="210" fontSize="12" fill="#333">Pembayaran</text>
              
              {/* Path - Tidak (Belum Bayar) */}
              <path d="M 610 220 L 610 270 L 870 270 L 870 200" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              <text x="615" y="240" fontSize="10" fill="#F44336">Tidak</text>
              <text x="615" y="275" fontSize="10" fill="#666">(Bayar saat ambil)</text>
              
              {/* Merge Gateway */}
              <g transform="translate(890, 200)">
                <rect x="-20" y="-20" width="40" height="40" fill="white" stroke="#FF9800" strokeWidth="2" transform="rotate(45)" rx="3"/>
                <text x="-8" y="5" fontSize="14" fontWeight="bold">+</text>
              </g>
              
              <path d="M 810 200 L 870 200" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              
              {/* Task - Kirim ke Produksi */}
              <rect x="940" y="175" width="120" height="50" fill="white" stroke="#F57C00" strokeWidth="2" rx="5"/>
              <text x="965" y="195" fontSize="12" fill="#333">Kirim Order</text>
              <text x="960" y="210" fontSize="12" fill="#333">ke Produksi</text>
              
              <path d="M 910 200 L 940 200" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              
              {/* Message flow ke produksi */}
              <path d="M 1000 225 L 1000 365" stroke="#9C27B0" strokeWidth="2" strokeDasharray="5,5" fill="none" markerEnd="url(#arrowhead-message)"/>
              
              {/* Task - Notifikasi Selesai */}
              <rect x="1110" y="175" width="120" height="50" fill="white" stroke="#F57C00" strokeWidth="2" rx="5"/>
              <text x="1135" y="195" fontSize="12" fill="#333">Notifikasi</text>
              <text x="1145" y="210" fontSize="12" fill="#333">Selesai</text>
              
              {/* Message flow dari produksi */}
              <path d="M 1170 470 L 1170 225" stroke="#9C27B0" strokeWidth="2" strokeDasharray="5,5" fill="none" markerEnd="url(#arrowhead-message)"/>
              
              {/* Gateway - Ambil/Antar */}
              <g transform="translate(1280, 200)">
                <rect x="-20" y="-20" width="40" height="40" fill="white" stroke="#FF9800" strokeWidth="2" transform="rotate(45)" rx="3"/>
                <text x="-6" y="5" fontSize="14" fontWeight="bold">?</text>
              </g>
              <text x="1255" y="240" fontSize="10" fill="#333">Ambil/Antar?</text>
              
              <path d="M 1230 200 L 1260 200" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              
              {/* Path - Ambil */}
              <path d="M 1280 180 L 1280 140 L 1130 140 L 1130 95" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead-message)"/>
              <text x="1190" y="135" fontSize="10" fill="#4CAF50">Ambil</text>
              
              {/* Path - Antar */}
              <path d="M 1300 200 L 1340 200" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              <text x="1305" y="195" fontSize="10" fill="#2196F3">Antar</text>
              
              <rect x="1340" y="285" width="30" height="50" fill="white" stroke="#F57C00" strokeWidth="2" rx="5"/>
              <text x="1346" y="315" fontSize="18" fill="#333">⚑</text>
              
              {/* Subprocess marker */}
              <rect x="1345" y="327" width="20" height="6" fill="none" stroke="#666" strokeWidth="1"/>
              <path d="M 1350 330 L 1355 330 M 1360 330 L 1365 330" stroke="#666" strokeWidth="1"/>
              <text x="1305" y="280" fontSize="11" fill="#333">Delivery</text>
              
              <path d="M 1355 285 L 1355 200" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
            </g>

            {/* Pool 3: Produksi/Laundry */}
            <g>
              <rect x="10" y="370" width="1380" height="120" fill="#E8F5E9" stroke="#388E3C" strokeWidth="2" rx="5"/>
              <text x="20" y="430" fontSize="16" fontWeight="bold" fill="#1B5E20">PRODUKSI</text>
              
              {/* Start Event (Message) */}
              <circle cx="1000" cy="430" r="15" fill="white" stroke="#4CAF50" strokeWidth="2"/>
              <circle cx="1000" cy="430" r="11" fill="white" stroke="#4CAF50" strokeWidth="1.5"/>
              <text x="975" y="410" fontSize="11" fill="#333">Terima Order</text>
              
              {/* Task - Cuci */}
              <rect x="1040" y="405" width="80" height="50" fill="white" stroke="#388E3C" strokeWidth="2" rx="5"/>
              <text x="1070" y="435" fontSize="12" fill="#333">Cuci</text>
              
              {/* Task - Kering */}
              <rect x="1140" y="405" width="80" height="50" fill="white" stroke="#388E3C" strokeWidth="2" rx="5"/>
              <text x="1165" y="435" fontSize="12" fill="#333">Kering</text>
              
              {/* Task - Setrika */}
              <rect x="1240" y="405" width="80" height="50" fill="white" stroke="#388E3C" strokeWidth="2" rx="5"/>
              <text x="1263" y="435" fontSize="12" fill="#333">Setrika</text>
              
              {/* Task - Packing */}
              <rect x="1340" y="405" width="30" height="50" fill="white" stroke="#388E3C" strokeWidth="2" rx="5"/>
              <text x="1345" y="425" fontSize="12" fill="#333">📦</text>
              <text x="1310" y="470" fontSize="11" fill="#333">Packing</text>
              
              {/* Subprocess marker on Packing */}
              <rect x="1345" y="447" width="20" height="6" fill="none" stroke="#666" strokeWidth="1"/>
              <path d="M 1350 450 L 1355 450 M 1360 450 L 1365 450" stroke="#666" strokeWidth="1"/>
              
              {/* Arrows */}
              <path d="M 1015 430 L 1040 430" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              <path d="M 1120 430 L 1140 430" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              <path d="M 1220 430 L 1240 430" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              <path d="M 1320 430 L 1340 430" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
            </g>

            {/* Pool 4: Kurir (Delivery) */}
            <g>
              <rect x="10" y="510" width="1380" height="100" fill="#FCE4EC" stroke="#C2185B" strokeWidth="2" rx="5"/>
              <text x="20" y="560" fontSize="16" fontWeight="bold" fill="#880E4F">KURIR</text>
              
              {/* Start Event (Message) */}
              <circle cx="1280" cy="560" r="15" fill="white" stroke="#4CAF50" strokeWidth="2"/>
              <circle cx="1280" cy="560" r="11" fill="white" stroke="#4CAF50" strokeWidth="1.5"/>
              <text x="1250" y="540" fontSize="11" fill="#333">Terima Order</text>
              
              {/* Message from Admin */}
              <path d="M 1355 315 L 1355 545" stroke="#9C27B0" strokeWidth="2" strokeDasharray="5,5" fill="none" markerEnd="url(#arrowhead-message)"/>
              
              {/* Task - Antar */}
              <rect x="1320" y="535" width="100" height="50" fill="white" stroke="#C2185B" strokeWidth="2" rx="5"/>
              <text x="1335" y="555" fontSize="12" fill="#333">Antar Cucian</text>
              <text x="1340" y="570" fontSize="12" fill="#333">ke Customer</text>
              
              <path d="M 1295 560 L 1320 560" stroke="#666" strokeWidth="2" fill="none" markerEnd="url(#arrowhead)"/>
              
              {/* Message to Customer */}
              <path d="M 1280 535 L 1280 95" stroke="#9C27B0" strokeWidth="2" strokeDasharray="5,5" fill="none" markerEnd="url(#arrowhead-message)"/>
            </g>

            {/* Arrow markers */}
            <defs>
              <marker id="arrowhead" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto">
                <polygon points="0 0, 10 3, 0 6" fill="#666" />
              </marker>
              <marker id="arrowhead-message" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto">
                <polygon points="0 0, 10 3, 0 6" fill="#9C27B0" />
              </marker>
            </defs>
          </svg>
        </div>

        {/* Improvements Summary */}
        <div className="mt-8 bg-white p-6 rounded-lg shadow">
          <h2 className="text-2xl font-bold mb-4 text-gray-800">✅ Perbaikan yang Dilakukan:</h2>
          <div className="grid md:grid-cols-2 gap-4">
            <div>
              <h3 className="font-bold text-green-600 mb-2">Struktur & Organisasi:</h3>
              <ul className="list-disc ml-5 space-y-1 text-sm text-gray-700">
                <li>Menggunakan 4 Pool yang jelas: Customer, Admin/Staff, Produksi, Kurir</li>
                <li>Menghilangkan swimlane yang berlebihan</li>
                <li>Setiap pool memiliki tanggung jawab yang jelas</li>
              </ul>
            </div>
            <div>
              <h3 className="font-bold text-green-600 mb-2">Gateway & Flow:</h3>
              <ul className="list-disc ml-5 space-y-1 text-sm text-gray-700">
                <li>Setiap split gateway memiliki merge gateway yang sesuai</li>
                <li>Label kondisi gateway yang jelas (Ya/Tidak, Bayar Sekarang/Nanti)</li>
                <li>Tidak ada flow yang terputus</li>
              </ul>
            </div>
            <div>
              <h3 className="font-bold text-green-600 mb-2">Notasi BPMN:</h3>
              <ul className="list-disc ml-5 space-y-1 text-sm text-gray-700">
                <li>Start Event: circle dengan border tipis</li>
                <li>End Event: circle dengan border tebal</li>
                <li>Message Flow: garis putus-putus antar pool</li>
                <li>Sequence Flow: garis solid dalam pool</li>
              </ul>
            </div>
            <div>
              <h3 className="font-bold text-green-600 mb-2">Penamaan & Clarity:</h3>
              <ul className="list-disc ml-5 space-y-1 text-sm text-gray-700">
                <li>Tidak ada typo</li>
                <li>Nama aktivitas konsisten dan jelas</li>
                <li>Menggunakan format Verb-Noun</li>
                <li>Subprocess ditandai dengan simbol +</li>
              </ul>
            </div>
          </div>
        </div>

        {/* Key Differences */}
        <div className="mt-6 bg-blue-50 p-6 rounded-lg border border-blue-200">
          <h2 className="text-xl font-bold mb-3 text-blue-800">🔑 Perbedaan Utama dengan Diagram Sebelumnya:</h2>
          <div className="space-y-2 text-sm text-gray-700">
            <p><strong>1. Pembayaran Fleksibel:</strong> Customer bisa pilih bayar sekarang atau saat ambil, keduanya di-merge dengan benar</p>
            <p><strong>2. Message Flow yang Jelas:</strong> Komunikasi antar pool menggunakan garis putus-putus (message flow)</p>
            <p><strong>3. Proses Delivery Terpisah:</strong> Kurir memiliki pool sendiri untuk clarity</p>
            <p><strong>4. Gateway Balance:</strong> Setiap split ada merge-nya</p>
            <p><strong>5. Subprocess Indicator:</strong> Proses kompleks (Delivery, Packing) ditandai dengan simbol +</p>
            <p><strong>6. Notifikasi Eksplisit:</strong> Ada proses notifikasi ketika cucian selesai</p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default ImprovedBPMN;
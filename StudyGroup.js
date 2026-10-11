import React, { useState, useEffect } from 'react';

const KonamiEasterEgg = () => {
  const [activated, setActivated] = useState(false);
  const [keys, setKeys] = useState([]);
  
  const konamiCode = [
    'ArrowUp', 'ArrowUp', 
    'ArrowDown', 'ArrowDown',
    'ArrowLeft', 'ArrowRight', 
    'ArrowLeft', 'ArrowRight',
    'b', 'a'
  ];

  useEffect(() => {
    const handleKeyDown = (e) => {
      const newKeys = [...keys, e.key.toLowerCase()].slice(-10);
      setKeys(newKeys);
      
      const codeMatch = konamiCode.every((key, i) => 
        newKeys[i]?.toLowerCase() === key.toLowerCase()
      );
      
      if (codeMatch) {
        setActivated(true);
        setTimeout(() => setActivated(false), 5000);
        setKeys([]);
      }
    };

    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [keys]);

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-900 via-purple-900 to-slate-900 flex items-center justify-center p-8">
      <div className="max-w-2xl w-full">
        <div className="bg-white/10 backdrop-blur-lg rounded-2xl p-8 shadow-2xl border border-white/20">
          <h1 className="text-4xl font-bold text-white mb-4 text-center">
            🎮 Coba Temukan Easter Egg! 🎮
          </h1>
          <p className="text-gray-300 text-center mb-8">
            Petunjuk: Coba ketik Konami Code yang legendaris...
          </p>
          
          <div className="bg-black/30 rounded-lg p-6 mb-6">
            <p className="text-green-400 font-mono text-center text-sm mb-2">
              Hint: ⬆️ ⬆️ ⬇️ ⬇️ ⬅️ ➡️ ⬅️ ➡️ B A
            </p>
            <p className="text-gray-400 text-center text-xs">
              (Gunakan arrow keys di keyboard Anda)
            </p>
          </div>

          <div className="text-center text-gray-400 text-sm">
            <p>💡 Tips: Ini adalah kode rahasia dari era game klasik!</p>
          </div>
        </div>
      </div>

      {/* Easter Egg Activation */}
      {activated && (
        <div className="fixed inset-0 pointer-events-none flex items-center justify-center z-50">
          <div className="animate-bounce">
            <div className="text-9xl mb-4 text-center animate-pulse">
              🎉
            </div>
            <div className="bg-gradient-to-r from-pink-500 via-purple-500 to-indigo-500 text-white text-4xl font-bold px-12 py-6 rounded-2xl shadow-2xl animate-pulse">
              KODE RAHASIA DITEMUKAN! 🚀
            </div>
            <div className="text-center mt-6 text-2xl">
              <div className="animate-spin inline-block">⭐</div>
              <span className="text-white mx-4 font-bold">SELAMAT!</span>
              <div className="animate-spin inline-block">⭐</div>
            </div>
          </div>
          
          {/* Confetti effect */}
          <div className="fixed inset-0">
            {[...Array(30)].map((_, i) => (
              <div
                key={i}
                className="absolute animate-pulse"
                style={{
                  left: `${Math.random() * 100}%`,
                  top: `${Math.random() * 100}%`,
                  animationDelay: `${Math.random() * 2}s`,
                  fontSize: `${Math.random() * 30 + 20}px`,
                }}
              >
                {['🎮', '🏆', '⚡', '🌟', '💎', '🔥'][Math.floor(Math.random() * 6)]}
              </div>
            ))}
          </div>
        </div>
      )}
    </div>
  );
};

export default KonamiEasterEgg;
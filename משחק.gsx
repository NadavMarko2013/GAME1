import React, { useState } from 'react';
import { Trophy, HelpCircle, CheckCircle2, XCircle, ArrowRight, RotateCcw, ChevronDown } from 'lucide-react';

const QUESTIONS = [
  {
    id: 1,
    question: "מי הקבוצה שזכתה הכי הרבה פעמים בליגת האלופות?",
    options: [
      "באיירן מינכן",
      "ליברפול",
      "ריאל מדריד",
      "ברצלונה"
    ],
    correctAnswer: 2 // אינדקס 2 = ריאל מדריד
  }
];

export default function FootballQuiz() {
  const [isOpen, setIsOpen] = useState(false);
  const [selectedOption, setSelectedOption] = useState(null);
  const [isSubmitted, setIsSubmitted] = useState(false);

  const currentQuestion = QUESTIONS[0];

  const handleSelectOption = (index) => {
    if (isSubmitted) return;
    setSelectedOption(index);
  };

  const handleSubmit = () => {
    if (selectedOption === null) return;
    setIsSubmitted(true);
  };

  const handleReset = () => {
    setSelectedOption(null);
    setIsSubmitted(false);
  };

  return (
    <div dir="rtl" className="min-h-screen bg-slate-950 text-white font-sans flex flex-col items-center justify-center p-4 relative overflow-hidden">
      {/* אלמנטים דקורטיביים ברקע - בסגנון ליגת האלופות */}
      <div className="absolute top-0 left-1/4 w-96 h-96 bg-blue-600/20 rounded-full blur-3xl pointer-events-none"></div>
      <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-indigo-600/20 rounded-full blur-3xl pointer-events-none"></div>
      
      {/* כותרת ראשית */}
      <header className="text-center mb-8 z-10">
        <div className="inline-flex items-center gap-3 bg-slate-900/80 border border-blue-500/30 px-6 py-2 rounded-full mb-4 backdrop-blur-md shadow-lg shadow-blue-500/10">
          <Trophy className="w-6 h-6 text-amber-400 animate-pulse" />
          <span className="text-sm font-semibold tracking-wide text-blue-200">חידון הכדורגל הגדול</span>
        </div>
        <h1 className="text-4xl md:text-5xl font-black bg-gradient-to-r from-white via-blue-100 to-blue-400 bg-clip-text text-transparent">
          אתגר ליגת האלופות
        </h1>
      </header>

      {/* מיכל המשחק המרכזי */}
      <main className="w-full max-w-lg z-10">
        {!isOpen ? (
          /* כפתור פתיחת השאלה */
          <button
            onClick={() => setIsOpen(true)}
            className="w-full group bg-gradient-to-r from-blue-700 via-indigo-700 to-blue-800 hover:from-blue-600 hover:to-indigo-600 text-white p-6 rounded-2xl shadow-xl shadow-blue-900/30 transition-all duration-300 transform hover:-translate-y-1 border border-blue-400/30 flex items-center justify-between

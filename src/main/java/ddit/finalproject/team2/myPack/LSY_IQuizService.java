package ddit.finalproject.team2.myPack;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ddit.finalproject.team2.vo.Ljs_EvaluationMaterialVo;
import ddit.finalproject.team2.vo.Lsy_EmbraceAnswer;
import ddit.finalproject.team2.vo.Lsy_EmbraceExamAnswer;
import ddit.finalproject.team2.vo.Lsy_EmbraceExamVo;
import ddit.finalproject.team2.vo.Lsy_EmbraceQuizVo;
import ddit.finalproject.team2.vo.Lsy_ExamProblemVo;
import ddit.finalproject.team2.vo.Lsy_ExamQuestionVo;
import ddit.finalproject.team2.vo.Lsy_ExamVo;
import ddit.finalproject.team2.vo.Lsy_LectureInfos;
import ddit.finalproject.team2.vo.Lsy_QuizProblemVo;
import ddit.finalproject.team2.vo.Lsy_QuizQuestionVO;
import ddit.finalproject.team2.vo.ProfessorVo;


public interface LSY_IQuizService {
	public int createQuiz(Lsy_EmbraceQuizVo quizChunk);
	public int createStAnswer(Lsy_EmbraceAnswer stQuizChunk, Lsy_QuizQuestionVO quizMap);
	public int createExam(Lsy_EmbraceExamVo examChunk);
	public int createExamAnswer(Lsy_EmbraceExamAnswer answerList, Ljs_EvaluationMaterialVo material, String exam_type);
	
	public List<Lsy_QuizQuestionVO> retreiveQuiz(Lsy_QuizQuestionVO quizList);
	public Lsy_QuizQuestionVO retrieveOneQuiz(String question_no);
	public Lsy_ExamVo retrieveOneExam(String examNo);
	public Lsy_ExamVo retrieveUpdatedExam(Map<String, String> examMap);
	
	public List<Lsy_QuizQuestionVO> markingTest(Lsy_EmbraceAnswer stQuizChunk);
	
	public int updateQuiz(Lsy_QuizQuestionVO quizVo);
	public int updateProblems(Lsy_QuizProblemVo problemVo);
	public int updateExam(Lsy_ExamQuestionVo examVo);
	public int updateExamProblems(Lsy_ExamProblemVo problemVo);
	
	public List<String> stAnswerNextVal(int quizSize);
	public List<String> keyNextVal(int quizSize);
	public List<String> problemNoSeqVal(int problemSize);
	public List<String> answerNoSeqVal(int answerSize);
	
	public Map<String, Object> examNoNextVal(HashMap<String, String> examMap);
	public String retrieveStudyCode(HashMap<String, String> examMap);
	public String selectExamNo(Map<String, String> examMap);
	public Lsy_ExamVo retrieveExamList(HashMap<String, String> examMap);
	public Lsy_LectureInfos retrieveLectureInfoForViews(String lecture_code);
	public Lsy_LectureInfos retrieveLectureInfoForOneViews(Map<String, String> lectureMap);
	public ProfessorVo retrieveProInfos(String user_id);
	public Lsy_LectureInfos retreiveLectureInfoForList(Map<String, String> proMap);
	public List<Lsy_ExamVo> retrieveEvalStudyCodes(String lecture_code);
}

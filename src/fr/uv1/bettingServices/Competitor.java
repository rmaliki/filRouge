package fr.uv1.bettingServices;

import fr.uv1.bettingServices.exceptions.*;
/**
 * 
 * @author segarra <br>
 * <br>
 *         This interface declares all methods that should be provided by a
 *         competitor. <br>
 * 
 */
public interface Competitor {
	public int amir=5;
	/**
	 * tells if the name of the competitor is a valid one.
	 * 
	 * @return true if the competitor has a valid name.
	 */
	boolean hasValidName();
	
	
	
	abstract void imar();
	
	
	/**
	 * add a member to a team competitor.
	 * 
	 * @param member
	 *            the new member.
	 *            
	 * @throws ExistingCompetitorException
	 *             raised if the member is already registered for the team.
	 * @throws BadParametersException
	 *             raised if the member is not instantiated.
	 */
	void addMember(Competitor member) throws ExistingCompetitorException,
			BadParametersException;

	/**
	 * delete a member from a team competitor.
	 * 
	 * @param member
	 *            the member to delete.
	 *            
	 * @throws BadParametersException
	 *             raised if the member is not instantiated.
	 * @throws ExistingCompetitorException
	 *             raised if the member is not registered for the team.
	 */
	void deleteMember(Competitor member) throws BadParametersException,
			ExistingCompetitorException;
}